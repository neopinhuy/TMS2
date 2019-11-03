using Bridge.Html5;
using Common.Clients;
using Common.Extensions;
using Components.Extensions;
using MVVM;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using TMS.API.Models;

namespace Components
{
    public class SearchEntry : Component
    {
        private readonly Observable<int?> _value;
        private readonly Observable<string> _text;
        private readonly ObservableArray<object> _source;
        private FloatingTable<object> _table;
        private readonly string _refEntity;
        private readonly string _dataSource;
        private readonly Type _entityType;
        private HTMLInputElement _input;
        private readonly string _refValueField = "Id";
        private string _refDisplayField;
        private IEnumerable<GridPolicy> RefField;
        private readonly UserInterface _ui;

        public SearchEntry(Observable<int?> value, UserInterface ui)
        {
            _value = value;
            _ui = ui;
            _refEntity = ui.Reference.Name;
            _dataSource = ui.DataSourceFilter;
            _entityType = Type.GetType("TMS.API.Models." + _refEntity);
            _refDisplayField = ui.Format;
            if (_entityType == null)
            {
                throw new InvalidOperationException($"{_refEntity} is invalid entity");
            }
            _text = new Observable<string>();
            _source = new ObservableArray<object>();
            _text.Subscribe((arg) =>
            {
                if (arg.NewData.IsNullOrEmpty())
                {
                    _value.Data = null;
                }
            });
        }

        public override async Task RenderAsync()
        {
            _masterData = await MasterData.GetSingletonAsync();
            Html.Instance.Input.PlaceHolder(_ui.Label).Value(_text)
                .Attr("data-role", "input").ClassName("input-small")
                .AsyncEvent(EventType.Focus, RenderSuggestion)
                .Event(EventType.Blur, DestroySuggestion)
                .Event(EventType.KeyDown, (Event e) =>
                {
                    if (e["keyCode"].ToString() == "38") _table.MoveUp();
                    if (e["keyCode"].ToString() == "40") _table.MoveDown();
                });
            _input = Html.Context as HTMLInputElement;
            SearchRefField();
            _value.Subscribe(arg =>
            {
                UpdateSearchText();
            });
        }

        private void SearchRefField()
        {
            Window.SetTimeout(async () =>
            {
                _source.Data = await GetDataSource();
                RefField = await Client<GridPolicy>.Instance.GetList($"$filter=EntityId eq {_ui.ReferenceId}");
                UpdateSearchText();
            });
        }

        private async Task<object[]> GetDataSource()
        {
            var source = await Client<object>.Instance.GetListEntity(_refEntity, _dataSource);
            return source.ToArray();
        }

        public async Task RenderSuggestion()
        {
            var position = _input.GetBoundingClientRect();
            var headers = RefField.Select(x => new Header<object>()
                {
                    FieldName = x.FieldName,
                    HeaderText = x.ShortDesc
                }).ToArray();
            if (_source.Data.Length == 0)
                _source.Data = await GetDataSource();
            var tableParam = new TableParam<object>
            {
                RowClick = Select,
                RowData = _source,
                Headers = new ObservableArray<Header<object>>(headers)
            };
            _table = new FloatingTable<object>(tableParam)
            {
                Top = position.Bottom,
                Left = position.Left - 1
            };
            Html.Take(Document.Body);
            await _table.RenderAsync();
        }

        private void Select(object rowData)
        {
            if (rowData != null) SetTextData(rowData);
            _value.Data = (int)rowData[_refValueField];
            DisposeSearchTable();
        }

        private void SetTextData(object rowData)
        {
            if (rowData is null)
            {
                throw new ArgumentNullException(nameof(rowData));
            }

            _text.Data = Utils.FormatWith(_ui.Format, rowData);
        }

        private void UpdateSearchText()
        {
            var selected = _source.Data.FirstOrDefault(x => x[_refValueField]?.ToString() == _value.Data.ToString());
            if (selected != null) SetTextData(selected);
        }

        private void DisposeSearchTable()
        {
            if (_table != null)
            {
                _table.Dispose();
                _table = null;
            }
        }

        public void DestroySuggestion()
        {
            Window.SetTimeout(DisposeSearchTable, 100);
        }
    }
}
