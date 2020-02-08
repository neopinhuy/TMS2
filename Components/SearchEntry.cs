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
        public Observable<int?> Value { get; private set; }
        public string Text { get { return _input.Value; } set { _input.Value = value; } }
        private HTMLInputElement _input;
        private FloatingTable<object> _table;
        private IEnumerable<GridPolicy> GridPolicy;
        private bool _hasFocusOut;
        private Paginator _paginator;
        private string _lastDataSource;
        private int _pageIndex;
        private int _total;
        private int _waitToClose;
        private readonly TMS.API.Models.Component UI;
        public string DataSourceFilter { get; set; }
        public readonly ObservableArray<object> Source;
        public object Matched { get; set; }

        public SearchEntry(TMS.API.Models.Component ui)
        {
            UI = ui ?? throw new System.ArgumentNullException(nameof(ui));
            DataSourceFilter = ui.DataSourceFilter;
            Source = new ObservableArray<object>();
        }

        public override void Render()
        {
            Value = new Observable<int?>((int?)Entity?.GetComplexPropValue(UI.FieldName));
            Value.Subscribe(arg =>
            {
                var res = ValueChanging?.Invoke(arg);
                if (res == false) return;
                SetMatchText();
                if (Entity != null) Entity.SetComplexPropValue(UI.FieldName, arg.NewData);
                ValueChanged?.Invoke(arg);
                this.DispatchEvent(UI.Events, EventType.Change, arg);
                var gridRow = Closest<TableRow>();
                var root = gridRow ?? RootComponent;
                CascadeField(root);
                PopulateFields(root);
            });
            Html.Take(RootHtmlElement).TabIndex(-1)
                .Event(EventType.FocusIn, async () => await RenderSuggestion())
                .Event(EventType.FocusOut, () =>
                {
                    _hasFocusOut = true;
                    HideTable();
                })
                .Input.PlaceHolder(UI.Label ?? string.Empty)
                .Attr("data-role", "input").ClassName("input-small")
                .Event(EventType.KeyDown, (Event e) =>
                {
                    var code = int.Parse(e["keyCode"].ToString());
                    if (!_hasFocusOut)
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
                        Value.Data = null;
                    }
                    // Searching here
                });
            InteractiveElement = _input = Html.Context as HTMLInputElement;
            SetMatchText();
        }

        private void PopulateFields(Component root)
        {
            if (UI.PopulateField.IsNullOrEmpty()) return;
            UI.PopulateField.Split(",").Where(x => x.HasAnyChar())
                .Select(x => x.Trim()).ForEach(field =>
                {
                    var value = Matched.GetComplexPropValue(field);
                    var com = root.FindComponentByName(field);
                    if (com is null) return;
                    switch (com)
                    {
                        case SearchEntry searchEntry:
                            searchEntry.Value.Data = (int?)value;
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
            if (UI.CascadeField.IsNullOrEmpty()) return;
            var com = root.FindComponentByName<SearchEntry>(UI.CascadeField);
            if (com is null) return;
            com.Value.Data = null;
            com.Source.NewValue = new object[] { };
        }

        public void SetMatchText()
        {
            if (Value is null || Value.Data is null)
            {
                Matched = null;
                _input.Value = string.Empty;
                return;
            }
            if (Matched != null && (int?)Matched[IdField] == Value.Data)
            {
                SetMatchedValue();
                return;
            }
            if (Source != null && Source.Data.HasElement())
            {
                Matched = Source.Data.FirstOrDefault(x => (int)x[IdField] == Value.Data.Value);
                SetMatchedValue();
                return;
            }
            Task.Run(async () =>
            {
                var ids = new List<int?> { Value.Data };
                var formattedDataSource = FormatDataSource();
                var noFilterQuery = OdataExtensions.RemoveFilterQuery(formattedDataSource);
                var query = OdataExtensions.FilterByIds(noFilterQuery, ids);
                var source = await Client<object>.Instance.GetListEntity(UI.Reference.Name, query);
                Matched = source?.value?.FirstOrDefault();
                SetMatchedValue();
            });
        }

        private void SetMatchedValue()
        {
            _input.Value = Matched != null ? Utils.FormatWith(UI.FormatData, Matched) : string.Empty;
        }

        private string FormatDataSource()
        {
            var dataSourceFilter = DataSourceFilter.HasAnyChar() ? DataSourceFilter : "?$filter=Active eq true";
            var dataSource = Utils.FormatWith(dataSourceFilter, Entity, true);
            return dataSource;
        }

        public async Task RenderSuggestion()
        {
            _hasFocusOut = false;
            if (_hasFocusOut) return;
            if (GridPolicy.Nothing())
            {
                var policies = await Client<GridPolicy>.Instance.GetList(
                        $"?$expand=Reference($select=Name)&$filter=Active eq true and " +
                        $"FeatureId eq null and Entity/Name eq '{UI.Reference.Name}'");
                GridPolicy = policies.value.OrderBy(x => x.Order);
            }
            var headers = GridPolicy.Select(MapTableHeader).ToArray();
            if (Source.Data.Nothing())
            {
                if (_hasFocusOut) return;
                ReloadData();
            }
            var tableParam = new TableParam<object>
            {
                RowClick = Select,
                RowData = Source,
                Headers = new ObservableArray<Header<object>>(headers)
            };
            if (_hasFocusOut) return;
            var position = InteractiveElement.GetBoundingClientRect();
            ToggleTable(position, tableParam);
        }

        private static Header<object> MapTableHeader(GridPolicy column)
        {
            return new Header<object>()
            {
                FieldName = column.FieldName,
                FormatCell = column.FormatCell,
                FormatRow = column.FormatRow,
                Order = column.Order,
                HeaderText = column.ShortDesc,
                Description = column.Description,
                Reference = column.Reference?.Name,
                DataSource = column.DataSource,
            };
        }

        private void ToggleTable(ClientRect position, TableParam<object> tableParam)
        {
            if (_table is null)
            {
                _table = new FloatingTable<object>(tableParam)
                {
                    Top = position.Bottom,
                    Left = position.Left - 1,
                    RootHtmlElement = RootHtmlElement
                };
                AddChild(_table);
                RenderPaginator();
            }
            else
            {
                _table.Show(true);
            }
        }

        public virtual async Task ReloadData(string dataSource = null)
        {
            _lastDataSource = dataSource ?? _lastDataSource ?? FormatDataSource();
            if (UI.Row is null || UI.Row == 0) UI.Row = 20;
            if (!_lastDataSource.Contains("?")) _lastDataSource += "?";
            var pagingQuery = _lastDataSource + $"&$skip={_pageIndex * UI.Row}&$top={UI.Row}&$count=true";
            var result = await Client<object>.Instance.GetListEntity(UI.Reference.Name,
                UI.Row > 0 ? pagingQuery : _lastDataSource);
            if (result == null)
            {
                throw new InvalidOperationException($"Cannot load data for the GridView {UI.Reference.Name}");
            }
            _total = result.odata?.count ?? 0;
            UpdatePagination();
            Source.Data = result.value?.ToArray();
        }

        private void UpdatePagination()
        {
            _paginator?.UpdateTotal(_total);
        }

        private void RenderPaginator()
        {
            _paginator = new Paginator(new PaginationOptions
            {
                Total = _total,
                PageSize = UI.Row ?? 12,
                ClickHandler = (page, e) =>
                {
                    e["preventDefault"].As<System.Action>().Invoke();
                    _pageIndex = page - 1;
                    _hasFocusOut = false;
                    ReloadData();
                },
            })
            {
                RootHtmlElement = _table.InteractiveElement
            };
            _table.AddChild(_paginator);
        }

        private void Select(object rowData)
        {
            if (rowData is null) return;
            Value.Data = (int)rowData[IdField];
            HideTable();
        }

        private void HideTable()
        {
            Window.ClearTimeout(_waitToClose);
            _waitToClose = Window.SetTimeout(() =>
            {
                if (!_hasFocusOut) return;
                _table?.Show(false);
            }, 10);
        }

        public override void UpdateView()
        {
            Value.Data = (int?)Entity?.GetComplexPropValue(UI.FieldName);
            Matched = null;
            SetMatchText();
        }
    }
}
