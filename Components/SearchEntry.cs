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
        public Observable<int?> value;
        public string Text { get { return _input.Value; } set { _input.Value = value; } }
        private HTMLInputElement _input;
        private FloatingTable<object> _table;
        private IEnumerable<GridPolicy> GridPolicy;
        private bool _isShowing;
        private readonly TMS.API.Models.Component _ui;
        public string DataSourceFilter { get; set; }
        public ObservableArray<object> Source { get; private set; }
        public object Matched { get; set; }

        public SearchEntry(TMS.API.Models.Component ui)
        {
            _ui = ui ?? throw new System.ArgumentNullException(nameof(ui));
            DataSourceFilter = ui.DataSourceFilter;
            Source = new ObservableArray<object>();
        }

        public override void Render()
        {
            value = new Observable<int?>((int?)Entity?.GetComplexPropValue(_ui.FieldName));
            value.Subscribe(arg =>
            {
                var res = ValueChanging?.Invoke(arg);
                if (res == false) return;
                SetMatchText();
                if (Entity != null) Entity.SetComplexPropValue(_ui.FieldName, arg.NewData);
                ValueChanged?.Invoke(arg);
                this.DispatchEvent(_ui.Events, EventType.Change, arg);
                var gridRow = Closest<TableRow>();
                var root = gridRow ?? RootComponent;
                CascadeField(root);
                PopulateFields(root);
            });
            Html.Take(RootHtmlElement).Input.PlaceHolder(_ui.Label ?? string.Empty)
                .Attr("data-role", "input").ClassName("input-small")
                .Event(EventType.KeyDown, (Event e) =>
                {
                    var code = int.Parse(e["keyCode"].ToString());
                    if (_isShowing)
                    {
                        if (code == 38) _table.MoveUp();
                        if (code == 40) _table.MoveDown();
                        if (code == 13) Select(Source.Data[_table.SelectedRow ?? 0]);
                    }
                    else if (code == 13) RenderSuggestion();
                })
                .Event(EventType.Input, () =>
                {
                    if (_input.Value.IsNullOrEmpty())
                    {
                        value.Data = null;
                    }
                    // Searching here
                });
            InteractiveElement = Html.Context;
            _input = InteractiveElement as HTMLInputElement;
            Html.Take(InteractiveElement.ParentElement).TabIndex(-1)
                    .Event(EventType.FocusIn, async () => await RenderSuggestion())
                    .Event(EventType.FocusOut, HideTable);
            SetMatchText();
        }

        private void PopulateFields(Component root)
        {
            if (_ui.PopulateField.IsNullOrEmpty()) return;
            _ui.PopulateField.Split(",").Where(x => x.HasAnyChar())
                .Select(x => x.Trim()).ForEach(field =>
                {
                    var value = Matched.GetComplexPropValue(field);
                    var com = root.FindComponentByName(field);
                    if (com is null) return;
                    switch (com)
                    {
                        case SearchEntry searchEntry:
                            searchEntry.value.Data = (int?)value;
                            break;
                        case Textbox textbox:
                            textbox.Value.Data = (string)value;
                            break;
                        case NumberInput number:
                            number.Value.Data = (decimal?)value;
                            break;
                    }
                });
        }

        private void CascadeField(Component root)
        {
            if (_ui.CascadeField.IsNullOrEmpty()) return;
            var com = root.FindComponentByName<SearchEntry>(_ui.CascadeField);
            if (com is null) return;
            com.value.Data = null;
            com.Source.NewValue = new object[] { };
        }

        public void SetMatchText()
        {
            if (value is null || value.Data is null)
            {
                Matched = null;
                _input.Value = string.Empty;
                return;
            }
            if (Matched != null && (int?)Matched[IdField] == value.Data)
            {
                SetMatchedValue();
                return;
            }
            if (Source != null && Source.Data.HasElement())
            {
                Matched = Source.Data.FirstOrDefault(x => (int)x[IdField] == value.Data.Value);
                SetMatchedValue();
                return;
            }
            Task.Run(async () =>
            {
                var ids = new List<int?> { value.Data };
                var formattedDataSource = FormatDataSource();
                var noFilterQuery = OdataExtensions.RemoveFilterQuery(formattedDataSource);
                var query = OdataExtensions.FilterByIds(noFilterQuery, ids);
                var source = await Client<object>.Instance.GetListEntity(_ui.Reference.Name, query);
                Matched = source?.value?.FirstOrDefault();
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
            return source?.value?.ToArray();
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
                GridPolicy = policies.value.OrderBy(x => x.Order);
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
            ToggleTable(position, tableParam);
        }

        private void ToggleTable(ClientRect position, TableParam<object> tableParam)
        {
            if (_table is null)
            {
                _table = new FloatingTable<object>(tableParam)
                {
                    Top = position.Bottom,
                    Left = position.Left - 1
                };
                Html.Take(InteractiveElement.ParentElement);
                AddChild(_table);
            }
            else
            {
                Html.Take(_table.RootHtmlElement).Display(true);
            }
            _isShowing = true;
        }

        private void Select(object rowData)
        {
            if (rowData is null) return;
            value.Data = (int)rowData[IdField];
            HideTable();
        }

        private void HideTable()
        {
            if (_table == null) return;
            Html.Take(_table.RootHtmlElement).Display(false);
            _isShowing = false;
        }
    }
}
