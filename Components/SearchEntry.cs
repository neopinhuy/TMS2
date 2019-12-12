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
        private HTMLInputElement _input;
        private FloatingTable<object> _table;
        private IEnumerable<GridPolicy> GridPolicy;
        private readonly UserInterface _ui;
        public string DataSourceFilter { get; set; }
        public ObservableArray<object> Source { get; private set; }
        public object Matched { get; set; }

        public SearchEntry(UserInterface ui)
        {
            _ui = ui ?? throw new System.ArgumentNullException(nameof(ui));
            DataSourceFilter = ui.DataSourceFilter;
            Source = new ObservableArray<object>();
        }

        public override void Render()
        {
            _value = new Observable<int?>((int?)Entity?.GetComplexPropValue(_ui.FieldName));
            _value.Subscribe(arg =>
            {
                var res = ValueChanging?.Invoke(arg);
                if (res == false) return;
                FindMatchItem();
                if (Entity != null) Entity.SetComplexPropValue(_ui.FieldName, arg.NewData);
                ValueChanged?.Invoke(arg);
                this.DispatchEvent(_ui.Events, EventType.Change, arg);
                if (_ui.CascadeDropdownId is null) return;
                var com = RootComponent.FindComponentById<SearchEntry>(_ui.CascadeDropdownId.Value);
                if (com is null) return;
                com.Source.NewValue = new object[] { };
            });
            Html.Take(RootHtmlElement).Input.PlaceHolder(_ui.Label ?? string.Empty)
                .Attr("data-role", "input").ClassName("input-small")
                .Event(EventType.Focus, async() => await RenderSuggestion())
                .Event(EventType.Blur, DestroySuggestion)
                .Event(EventType.KeyDown, (Event e) =>
                {
                    if (_table != null)
                    {
                        if (e["keyCode"].ToString() == "38") _table.MoveUp();
                        if (e["keyCode"].ToString() == "40") _table.MoveDown();
                        if (e["keyCode"].ToString() == "13") Select(Source.Data[_table.SelectedRow ?? 0]);
                    }
                    else if (e["keyCode"].ToString() == "13") RenderSuggestion();
                })
                .Event(EventType.Input, () =>
                {
                    if (_input.Value.IsNullOrEmpty())
                    {
                        _value.Data = null;
                    }
                    // Searching here
                });
            InteractiveElement = Html.Context;
            _input = InteractiveElement as HTMLInputElement;
            FindMatchItem();
        }

        private void FindMatchItem()
        {
            if (_value is null || _value.Data is null)
            {
                Matched = null;
                _input.Value = string.Empty;
                return;
            }
            if (Matched != null && (int?)Matched[IdField] == _value.Data)
            {
                SetMatchedValue();
                return;
            }
            if (Source != null && Source.Data.HasElement())
            {
                Matched = Source.Data.FirstOrDefault(x => (int)x[IdField] == _value.Data.Value);
                SetMatchedValue();
                return;
            }
            Task.Run(async () =>
            {
                var ids = new List<int?> { _value.Data };
                var formattedDataSource = FormatDataSource();
                var noFilterQuery = OdataExtensions.RemoveFilterQuery(formattedDataSource);
                var query = OdataExtensions.FilterByIds(noFilterQuery, ids);
                var source = await Client<object>.Instance.GetListEntity(_ui.Reference.Name, query);
                Matched = source?.Value?.FirstOrDefault();
                SetMatchedValue();
            });
        }

        private void SetMatchedValue()
        {
            _input.Value = Matched != null ? Utils.FormatWith(_ui.Format, Matched) : string.Empty;
        }

        private async Task<object[]> GetDataSource()
        {
            var dataSource = FormatDataSource();
            var source = await Client<object>.Instance.GetListEntity(_ui.Reference.Name, dataSource);
            return source?.Value?.ToArray();
        }

        private string FormatDataSource()
        {
            var dataSourceFilter = DataSourceFilter.HasAnyChar() ? DataSourceFilter : "?$filter=Active eq true";
            var dataSource = Utils.FormatWith(dataSourceFilter, Entity);
            return dataSource;
        }

        public async Task RenderSuggestion()
        {
            if (GridPolicy.Nothing())
            {
                var policies = await Client<GridPolicy>.Instance.GetList(
                        $"?$expand=Reference($select=Name)&$filter=Active eq true and " +
                        $"FeatureId eq null and Entity/Name eq '{_ui.Reference.Name}'");
                GridPolicy = policies.Value.OrderBy(x => x.Order);
            }
            var position = InteractiveElement.GetBoundingClientRect();
            var headers = GridPolicy.Select(column => new Header<object>()
            {
                FieldName = column.FieldName,
                FormatCell = column.FormatCell,
                FormatRow = column.FormatRow,
                Order = column.Order,
                HeaderText = column.ShortDesc,
                Description = column.Description,
                Reference = column.Reference?.Name,
                DataSource = column.DataSource,
            }).ToArray();
            if (Source == null || Source.Data.Length == 0)
            {
                Source.Data = await GetDataSource();
            }
            var tableParam = new TableParam<object>
            {
                RowClick = Select,
                RowData = Source,
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
            if (rowData is null) return;
            _value.Data = (int)rowData[IdField];
            DisposeSearchTable();
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
