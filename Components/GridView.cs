﻿using Bridge.Html5;
using Common.Clients;
using Common.Extensions;
using Components.Extensions;
using Components.Forms;
using MVVM;
using Newtonsoft.Json;
using System;
using System.Linq;
using System.Threading.Tasks;
using TMS.API.Models;
using ElementType = MVVM.ElementType;

namespace Components
{
    public class GridView : Component
    {
        public readonly UserInterface UI;
        private int _pageIndex = 0;
        private int _total = 0;
        private Table<object> _table;
        private HTMLElement _paginator;
        public ObservableArray<Header<object>> Header { get; set; }
        public ObservableArray<object> RowData { get; set; }
        public Action<ObservableArgs, Header<object>, object> CellChanged { get; set; }

        public GridView(UserInterface ui)
        {
            UI = ui ?? throw new ArgumentNullException(nameof(ui));
            Id = ui.Id;
            Name = ui.FieldName;
            Header = new ObservableArray<Header<object>>();
            RowData = new ObservableArray<object>();
            Header.Add(new Header<object>
            {
                StatusBar = true,
                HeaderText = "",
                Frozen = true
            });
        }

        public override void Render()
        {
            Task.Run(async () =>
            {
                var gridPolicyTask = LoadGridPolicy();
                var loadDataTask = ReloadData();
                await Task.WhenAll(gridPolicyTask, loadDataTask);
                if (gridPolicyTask is null || gridPolicyTask.Result is null)
                {
                    Toast.Warning("Can not load header for the GridView");
                    return;
                }
                var headers = gridPolicyTask.Result.value
                    .Where(x => !x.Hidden).Select(MapToHeader).ToArray();
                Header.AddRange(headers);
                RenderTable();
                Pagination();
            });
        }

        private Task<OdataResult<GridPolicy>> LoadGridPolicy()
        {
            return Client<GridPolicy>.Instance
                    .GetList("?$expand=Reference($select=Name)" +
                    "&orderby=Order" +
                    $"&$filter=Active eq true and Entity/Name eq '{UI.Reference.Name}' " +
                    $"and FeatureId eq {UI.ComponentGroup.FeatureId}");
        }

        public void RenderTable()
        {
            var tableParams = new TableParam<object>
            {
                Headers = Header,
                RowData = RowData,
                GroupBy = UI.GroupBy,
                GroupFormat = UI.GroupFormat,
            };
            BindingEvents(tableParams);
            _table = UI.GroupFormat.HasAnyChar() || UI.GroupBy.HasAnyChar()
                ? new GroupTable(tableParams)
                : new Table<object>(tableParams);
            _table.Entity = Entity;
            _table.BodyContextMenu += RenderContextMenu;
            Html.Take(RootHtmlElement).Clear();
            _table.CellChanged = (arg, header, data) => CellChanged?.Invoke(arg, header, data);
            AddChild(_table);
            _table.AfterRendered += () => AfterRendered?.Invoke();
        }

        private void BindingEvents(TableParam<object> tableParams)
        {
            if (!UI.Events.HasAnyChar()) return;
            var events = JsonConvert.DeserializeObject<object>(UI.Events);
            var dblClick = events[EventType.DblClick.ToString()]?.ToString();
            if (dblClick.HasAnyChar())
            {
                Html.Instance.DataAttr("dblclick", dblClick);
                tableParams.RowDblClick = row =>
                {
                    var parent = FindComponentEvent(dblClick);
                    parent.ExecuteEvent(dblClick, row, RowData, Header);
                };
            }
        }

        private Header<object> MapToHeader(GridPolicy column)
        {
            var header = new Header<object>
            {
                Id = column.Id,
                FieldName = column.FieldName,
                FormatCell = column.FormatCell,
                FormatRow = column.FormatRow,
                Order = column.Order,
                GroupName = column.GroupName,
                HeaderText = column.ShortDesc,
                Description = column.Description,
                Reference = column.Reference?.Name,
                DataSource = column.DataSource,
                RefValueField = "Id",
                HasFilter = column.HasFilter,
                Frozen = column.Frozen,
                Editable = column.Editable,
                Disabled = column.Disabled,
                Component = column.Component,
                Precision = column.Precision,
                Validation = column.Validation,
                Width = column.Width,
                MinWidth = column.MinWidth,
                MaxWidth = column.MaxWidth,
                ButtonClass = column.ButtonClass,
                ButtonIcon = column.ButtonIcon,
                PopulateField = column.PopulateField,
                CascadeField = column.CascadeField,
                Summary = column.Summary,
                SummaryColSpan = column.SummaryColSpan,
            };
            if (column.ButtonEvent.HasAnyChar())
            {
                header.ButtonEvent = (row) =>
                {
                    var parent = FindComponentEvent(column.ButtonEvent);
                    parent.ExecuteEvent(column.ButtonEvent, row);
                };
            }
            var parsed = Enum.TryParse(column.TextAlign, out TextAlign textAlign);
            if (parsed) header.TextAlign = textAlign;
            return header;
        }

        public void RenderContextMenu(Event e)
        {
            e.PreventDefault();
            var top = (float)e["clientY"];
            var left = (float)e["clientX"];
            Html.Take(Document.Body).Ul.ClassName("context-menu")
                .TabIndex(-1).Trigger(EventType.Focus).Floating(top, left);
            var menu = Html.Context;
            Html.Instance.Event(EventType.FocusOut, () => menu.Remove())
                .Li.Event(EventType.Click, DeleteSelected)
                .Icon("fa fa-trash").End.Span.Text("Delete selected rows").EndOf(ElementType.li);
        }

        public void UpdateRow(object row) => _table.UpdateRow(row);

        public virtual async Task ReloadData(string dataSource = null)
        {
            var formatted = Utils.FormatWith(UI.DataSourceFilter, Entity);
            dataSource = dataSource ?? formatted;
            var pagingQuery = dataSource + $"&$skip={_pageIndex * UI.Row}&$top={UI.Row}&$count=true";
            var result = await Client<object>.Instance.GetListEntity(UI.Reference.Name,
                UI.Row > 0 ? pagingQuery : dataSource);
            if (result == null) return;
            _total = result.odata?.count ?? 0;
            UpdatePagination();
            RowData.Data = result.value?.ToArray();
            if (Entity != null) Entity[UI.FieldName] = RowData.Data;
        }

        private void UpdatePagination()
        {
            if (UI.Row is null || UI.Row == 0) return;
            if (_paginator is null) return;
            Html.Take(_paginator).Pagination("updateItems", _total);
        }

        private void Pagination()
        {
            if (UI.Row is null || UI.Row == 0) return;
            if (_paginator is null)
            {
                Html.Take(RootHtmlElement).Ul.ClassName("pagination");
                _paginator = Html.Context as HTMLElement;
            }
            Html.Take(_paginator).Pagination(_total, UI.Row ?? 0, (page, e) =>
            {
                (e["preventDefault"] as System.Action)();
                _pageIndex = page - 1;
                ReloadData();
            });
        }

        public void DeleteSelected()
        {
            var confirm = new ConfirmDialog();
            confirm.Render();
            confirm.DeleteConfirmed += async () =>
            {
                confirm.Dispose();
                await Delete();
            };
        }

        public virtual async Task Delete()
        {
            var entity = UI.Reference.Name;
            var ids = RowData.Data
                .Where(x => (bool?)x["__selected__"] == true)
                .Select(x => (int)x[IdField]).ToList();
            var client = new Client(entity);
            var success = await client.Delete(ids);
            if (success)
            {
                Toast.Success("Delete succeeded");
                RowData.Data.Where(x => (bool?)x["__selected__"] == true).ForEach(RowData.Remove);
                ReloadData();
            }
            else
            {
                Toast.Warning("Delete failed");
            }
        }
    }
}
