using Bridge.Html5;
using Common.Clients;
using Common.Extensions;
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
        private IEnumerable<Field> RefField;
        private readonly UserInterface _ui;

        public SearchEntry(Observable<int?> value, UserInterface ui)
        {
            _value = value;
            _ui = ui;
            _refEntity = ui.Field.Reference.Name;
            _dataSource = ui.DataSourceFilter;
            _entityType = Type.GetType("TMS.API.Models." + _refEntity);
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
            Html.Instance.Input.PlaceHolder(_ui.Field.ShortDesc).Value(_text)
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
                var entity = _masterData.Entity.First(x => x.Name == _refEntity);
                RefField = _masterData.Field
                    .Where(x => x.EntityId == entity.Id && (x.IsRefDisplayField || x.IsRefValueField));
                _refDisplayField = RefField.First(X => X.IsRefDisplayField).FieldName;
                UpdateSearchText();
            });
        }

        private async Task<object[]> GetDataSource()
        {
            if (!_dataSource.IsNullOrEmpty())
            {
                var type = typeof(Client<>).MakeGenericType(new Type[] { _entityType });
                var httpGetList = type.GetMethod("GetList");
                var client = Activator.CreateInstance(type);
                var source = await httpGetList.Invoke(client, _dataSource).As<Task<IEnumerable<object>>>();
                return source.ToArray();
            }
            else
            {
                return _masterData.GetSourceByTypeName(_refEntity).ToArray();
            }
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
            _text.Data = rowData[_refDisplayField]?.ToString();
            _value.Data = (int)rowData[_refValueField];
            DisposeSearchTable();
        }

        private void UpdateSearchText()
        {
            var selected = _source.Data.FirstOrDefault(x => x["Id"]?.ToString() == _value.Data.ToString());
            _text.Data = selected?[_refDisplayField]?.ToString();
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
