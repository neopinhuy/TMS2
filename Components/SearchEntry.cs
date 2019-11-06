﻿using Bridge.Html5;
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
        private readonly Observable<int?> _value;
        private readonly Observable<string> _text;
        private readonly ObservableArray<object> _source;
        private FloatingTable<object> _table;
        private HTMLInputElement _input;
        private const string _refValueField = "Id";
        private IEnumerable<GridPolicy> RefField;
        private readonly UserInterface _ui;

        public object Entity { get; set; }

        public SearchEntry(UserInterface ui, object _entity)
        {
            Entity = _entity;
            _value = new Observable<int?>((int?)Entity?[ui.FieldName]);
            _ui = ui;
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

        public override void Render()
        {
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
                UpdateTextbox();
                Entity[_ui.FieldName] = arg.NewData;
            });
        }

        private void SearchRefField()
        {
            Window.SetTimeout(async () =>
            {
                _source.Data = await GetDataSource();
                RefField = await Client<GridPolicy>.Instance.GetList(
                    $"$filter=Active eq true and EntityId eq {_ui.ReferenceId}");
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
