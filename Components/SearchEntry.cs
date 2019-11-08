using Bridge.Html5;
using Common.Clients;
using Common.Extensions;
using Components.Extensions;
using MVVM;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using TMS.API.Models;

namespace Components
{
    public class SearchEntry : Component
    {
        private Observable<int?> _value;
        private readonly Observable<string> _text = new Observable<string>();
        private readonly ObservableArray<object> _source = new ObservableArray<object>();
        private FloatingTable<object> _table;
        private const string _refValueField = "Id";
        private IEnumerable<GridPolicy> RefField;
        private readonly UserInterface _ui;

        public SearchEntry(UserInterface ui)
        {
            _ui = ui ?? throw new System.ArgumentNullException(nameof(ui));
            _text.Subscribe((arg) =>
            {
                if (arg.NewData.IsNullOrEmpty())
                {
                    _value.Data = null;
                }
            });
        }

        public override void Render()
        {
            if (_ui.DataSourceFilter.HasAnyChar())
                _ui.DataSourceFilter = Utils.FormatWith(_ui.DataSourceFilter, Entity);
            _value = new Observable<int?>((int?)Entity?[_ui.FieldName]);
            _value.Subscribe(arg =>
            {
                UpdateTextbox();
                if (Entity != null) Entity[_ui.FieldName] = arg.NewData;
            });
            Html.Instance.Input.PlaceHolder(_ui.Label).Value(_text)
                .Attr("data-role", "input").ClassName("input-small")
                .AsyncEvent(EventType.Focus, RenderSuggestion)
                .Event(EventType.Blur, DestroySuggestion)
                .Event(EventType.KeyDown, (Event e) =>
                {
                    if (e["keyCode"].ToString() == "38") _table.MoveUp();
                    if (e["keyCode"].ToString() == "40") _table.MoveDown();
                });
            InteractiveElement = Html.Context;
            SearchRefField();
        }

        private void SearchRefField()
        {
            Window.SetTimeout(async () =>
            {
                _source.Data = await GetDataSource();
                RefField = await Client<GridPolicy>.Instance.GetList(
                    $"?$expand=Reference($select=Name)&$filter=Active eq true and " +
                    $"FeatureId eq null and EntityId eq {_ui.ReferenceId}");
                RefField = RefField.OrderBy(x => x.Order);
                UpdateTextbox();
            });
        }

        private async Task<object[]> GetDataSource()
        {
            var source = await Client<object>.Instance.GetListEntity(_ui.Reference.Name, _ui.DataSourceFilter);
            return source.ToArray();
        }

        public async Task RenderSuggestion()
        {
            var position = InteractiveElement.GetBoundingClientRect();
            var headers = RefField.Select(column => new Header<object>()
            {
                FieldName = column.FieldName,
                Format = column.Format,
                Order = column.Order,
                HeaderText = column.ShortDesc,
                Description = column.Description,
                Reference = column.Reference?.Name,
                DataSource = column.DataSource,
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
            _table.Render();
        }

        private void Select(object rowData)
        {
            _value.Data = (int)rowData[_refValueField];
            DisposeSearchTable();
        }

        private void UpdateTextbox()
        {
            var selected = _source.Data.FirstOrDefault(x => x[_refValueField]?.ToString() == _value.Data.ToString());
            if (selected is null)
            {
                _text.Data = string.Empty;
                return;
            }

            _text.Data = Utils.FormatWith(_ui.Format, selected);
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
