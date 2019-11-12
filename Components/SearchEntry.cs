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
        private FloatingTable<object> _table;
        private IEnumerable<GridPolicy> GridPolicy;
        private readonly UserInterface _ui;
        public bool SuggestActiveRecord { get; set; }
        public string DataSourceFilter { get; set; }
        public ObservableArray<object> Source { get; set; }

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
            DataSourceFilter = ui.DataSourceFilter;
            Source = new ObservableArray<object>();
        }

        public override void Render()
        {
            if (DataSourceFilter.HasAnyChar())
                DataSourceFilter = Utils.FormatWith(DataSourceFilter, Entity);
            _value = new Observable<int?>((int?)Entity?[_ui.FieldName]);
            _value.Subscribe(arg =>
            {
                UpdateTextbox();
                if (Entity != null) Entity[_ui.FieldName] = arg.NewData;
                ValueChanged?.Invoke(arg);
            });
            Html.Take(RootHtmlElement).Input.PlaceHolder(_ui.Label ?? string.Empty).Value(_text)
                .Attr("data-role", "input").ClassName("input-small")
                .Event(EventType.Focus, async() => await RenderSuggestion())
                .Event(EventType.Blur, DestroySuggestion)
                .Event(EventType.KeyDown, (Event e) =>
                {
                    if (e["keyCode"].ToString() == "38") _table.MoveUp();
                    if (e["keyCode"].ToString() == "40") _table.MoveDown();
                });
            InteractiveElement = Html.Context;
            FindMatchItem();
        }

        private void FindMatchItem()
        {
            Task.Run(async () =>
            {
                if (_value is null || _value.Data is null) return;
                object matched;
                if (Source != null && Source.Data.Length > 0)
                {
                    matched = Source.Data.FirstOrDefault(x => (int)x["Id"] == _value.Data);
                }
                else
                {
                    Source.Data = await GetDataSource();
                    matched = Source.Data.FirstOrDefault(x => (int)x["Id"] == _value.Data);
                }
                _text.Data = matched != null ? Utils.FormatWith(_ui.Format, matched) : string.Empty;
            });
        }

        private async Task<object[]> GetDataSource()
        {
            var source = await Client<object>.Instance.GetListEntity(_ui.Reference.Name, DataSourceFilter);
            return source.ToArray();
        }

        public async Task RenderSuggestion()
        {
            if (GridPolicy.Nothing())
            {
                GridPolicy = await Client<GridPolicy>.Instance.GetList(
                        $"?$expand=Reference($select=Name)&$filter=Active eq true and " +
                        $"FeatureId eq null and Entity/Name eq '{_ui.Reference.Name}'");
                GridPolicy = GridPolicy.OrderBy(x => x.Order);
            }
            var position = InteractiveElement.GetBoundingClientRect();
            var headers = GridPolicy.Select(column => new Header<object>()
            {
                FieldName = column.FieldName,
                Format = column.Format,
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
            if (SuggestActiveRecord)
            {
                Source.Data = Source.Data.Where(x => (bool)x["Active"]).ToArray();
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
            _value.Data = (int)rowData["Id"];
            DisposeSearchTable();
        }

        private void UpdateTextbox()
        {
            var selected = Source.Data.FirstOrDefault(x => (int)x["Id"] == _value.Data);
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
