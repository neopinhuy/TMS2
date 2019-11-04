using Bridge.Html5;
using Common.Clients;
using Common.Extensions;
using Components.Extensions;
using MVVM;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using ElementType = MVVM.ElementType;

namespace Components
{
    public class TableParam<Data>
    {
        public ObservableArray<Header<Data>> Headers { get; set; }
        public ObservableArray<Data> RowData { get; set; }
        public Action<Data> RowClick { get; set; }
        public Action<Data> RowDblClick { get; set; }
    }

    public class Table<T> : Component
    {
        public ObservableArray<Header<T>> Headers { get; set; }
        public ObservableArray<T> RowData { get; set; }
        
        private readonly TableParam<T> _tableParam;
        private IEnumerable<IEnumerable<object>> _refData;

        const string _selected = "selected-row";
        private int? selectedRow;
        public int? SelectedRow { 
            get => selectedRow; 
            set 
            {
                selectedRow = value;
                RootElement
                    .QuerySelectorAll("tbody tr").ToList()
                    .ForEach(x => x.ReplaceClass(_selected, string.Empty));
                if (selectedRow is null) return;
                RootElement.QuerySelectorAll("tbody tr")
                    .ElementAt(selectedRow.Value).AddClass(_selected);
            } 
        }

        private int? timeOut = null;

        public Table(TableParam<T> tableParam)
        {
            Headers = tableParam.Headers;
            RowData = tableParam.RowData;
            _tableParam = tableParam;
        }

        public override async Task RenderAsync()
        {
            Html.Instance.Div.ClassName("table-wrapper");
            RootElement = Html.Context as HTMLElement;
            Html.Instance.Table.ClassName("table striped");
            var table = Html.Context;
            Rerender(table);
            Html.Instance.End.End.Render();
            Headers.Subscribe(x =>
            {
                // Rerender(table);
            });
            RowData.Subscribe(args =>
            {
                if (args.Action == ObservableAction.Update)
                {
                    // Update the row
                }
                Rerender(table);
            });
        }

        private void Rerender(Element table)
        {
            if (timeOut != null)
            {
                Window.ClearTimeout(timeOut.Value);
            }
            timeOut = Window.SetTimeout(async () =>
            {
                Html.Take(table).Clear();
                var headers = from header in Headers.Data
                    group header by header.GroupName into headerGroup
                    select headerGroup.ToList();
                Headers.NewValue = headers.SelectMany(x => x).ToArray();
                RenderTableHeader(table);
                // Load all master data
                var refEntities = Headers.Data
                    .Where(x => x.Reference.HasAnyChar())
                    .DistinctBy(x => x.Reference + x.DataSource)
                    .Select(x => Client<object>.Instance.GetListEntity(x.Reference, x.DataSource));
                _refData = await Task.WhenAll(refEntities);
                RenderTableContent(table);
            });
        }

        private void RenderTableHeader(Element table)
        {
            var html = Html.Take(table);
            var headers = Headers.Data;
            bool hasGroup = Headers.Data.Any(x => !string.IsNullOrEmpty(x.GroupName));
            // Render first header
            html.Thead.TRow.ForEach(headers, (header, index) =>
            {
                if (hasGroup && !string.IsNullOrEmpty(header.GroupName))
                {
                    if (header != headers.FirstOrDefault(x => x.GroupName == header.GroupName)) return;
                    html.Th.Render();
                    html.ColSpan(headers.Count(x => x.GroupName == header.GroupName));
                    html.Text(header.GroupName).Render();
                    return;
                }
                html.Th.Render();
                if (hasGroup && string.IsNullOrEmpty(header.GroupName))
                {
                    html.RowSpan(2);
                }
                if (header.EditEvent != null || header.DeleteEvent != null)
                {
                    html.TextAlign(TextAlign.center).Icon("mif-folder-open").Margin(Direction.right, 0).End.Render();
                }
                else
                {
                    html.Span.Text(header.HeaderText).End.Render();
                    if (header.HasFilter)
                    {
                        html.Span.ClassName("fa fa-filter").Event(EventType.Click, async (e) =>
                        {
                            Html.Take(e.Target as HTMLElement).Closest(ElementType.th);
                            var boudingRect = Html.Context.GetBoundingClientRect();
                            var filter = new ColumnFilter();
                            await filter.RenderAsync();
                            filter.Top = boudingRect.Bottom;
                            filter.Left = boudingRect.Left;
                            filter.Toggle();
                        }).End.Render();
                    }
                }
                html.EndOf(ElementType.th);
            }).EndOf(ElementType.tr).Render();

            if (hasGroup)
            {
                html.TRow.ForEach(headers, (header, index) =>
                {
                    if (hasGroup && !string.IsNullOrEmpty(header.GroupName))
                    {
                        html.Th.Span.Text(header.HeaderText).EndOf(ElementType.th);
                    }
                });
            }
            html.EndOf(ElementType.thead);
        }

        private void RenderTableContent(Element table)
        {
            var html = Html.Take(table);
            html.TBody.ForEach(RowData.Data, RenderRowData).EndOf(ElementType.table).Render();
        }

        private void RenderRowData(T row, int index)
        {
            var html = Html.Instance;
            html.TRow.Render();
            if (_tableParam.RowClick != null) html.Event(EventType.Click, _tableParam.RowClick, row);
            if (_tableParam.RowDblClick != null) html.Event(EventType.DblClick, _tableParam.RowDblClick, row);
            html.ForEach(Headers.Data, (header, headerIndex) =>
            {
                html.TData.Render();
                if (header.EditEvent != null)
                {
                    html.Button.ClassName("button small warning")
                        .Event(EventType.Click, async(data) => {
                            await header.EditEvent(data);
                        }, row)
                        .Span.ClassName("fa fa-edit").EndOf(ElementType.button);
                }
                if (header.DeleteEvent != null)
                {
                    html.Button.ClassName("button small secondary").Margin(Direction.left, 4)
                        .AsyncEvent(EventType.Click, header.DeleteEvent, row)
                        .Span.ClassName("fa fa-trash").EndOf(ElementType.button);
                }
                if (string.IsNullOrEmpty(header.FieldName)) return;
                if (!row.HasOwnProperty(header.FieldName)) return;
                object cellData = row[header.FieldName];
                string cellText = cellData?.ToString() ?? string.Empty;
                if (cellData != null && cellData is DateTime)
                {
                    cellText = string.Format("{0:dd/MM/yyyy}", cellData as DateTime?);
                }
                if (header.Reference != null)
                {
                    var source = _refData.GetSourceByTypeName(header.Reference);
                    var found = source.FirstOrDefault(x => x[header.RefValueField] == cellData);
                    cellText = found?[header.RefDisplayField.Trim()]?.ToString();
                    header.TextAlign = !string.IsNullOrEmpty(cellText) ? TextAlign.left : header.TextAlign;
                }
                if (header.Format.HasAnyChar()) cellText = string.Format("{0:" + header.Format + "}", cellData);
                header.TextAlign = CalcTextAlign(header.TextAlign, cellData);
                html.TextAlign(header.TextAlign).Text(cellText).End.Render();
            });
        }

        private static TextAlign? CalcTextAlign(TextAlign? textAlign, object cellData)
        {
            if (textAlign != null || cellData is null)
                return textAlign;
            if (cellData.GetType().IsNumber())
            {
                return TextAlign.right;
            }
            else if (cellData is string)
            {
                return TextAlign.left;
            }
            return TextAlign.center;
        }

        public void MoveUp()
        {
            if (SelectedRow is null || SelectedRow == 0) SelectedRow = RowData.Data.Length - 1;
            else if (SelectedRow > 0) SelectedRow--;
        }

        public void MoveDown()
        {
            if (SelectedRow is null || SelectedRow == RowData.Data.Length - 1) SelectedRow = 0;
            else if (SelectedRow < RowData.Data.Length - 1) SelectedRow++;
        }
    }
}
