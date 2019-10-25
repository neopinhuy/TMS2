﻿using Bridge.Html5;
using MVVM;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using TMS.API.Models;

namespace Components
{
    public class SearchEntry : Component
    {
        private readonly Observable<int> _value;
        private readonly Observable<string> _text;
        private readonly ObservableArray<object> _source;
        private FloatingTable<object> _table;
        private readonly string _refEntity;
        private HTMLInputElement _input;
        private readonly string _refValueField = "Id";
        private string _refDisplayField;
        private IEnumerable<Field> RefField;

        public SearchEntry(Observable<int> value, string refEntity)
        {
            _value = value;
            _refEntity = refEntity;
            _text = new Observable<string>();
            _source = new ObservableArray<object>();
        }

        public override async Task RenderAsync()
        {
            await SearchRefField();

            Html.Instance.Input.Value(_text)
                .AsyncEvent(EventType.Focus, RenderSuggestion)
                .Event(EventType.Blur, DestroySuggestion)
                .Event(EventType.KeyDown, (Event e) =>
                {
                    if (e["keyCode"].ToString() == "38") _table.MoveUp();
                    if (e["keyCode"].ToString() == "40") _table.MoveDown();
                });
            _input = Html.Context as HTMLInputElement;
            UpdateSearchText();
            _value.Subscribe(arg =>
            {
                UpdateSearchText();
            });
        }

        private async Task SearchRefField()
        {
            _masterData = await MasterData.GetSingletonAsync();
            var entity = _masterData.Entity.First(x => x.Name == _refEntity);
            RefField = _masterData.Field
                .Where(x => x.EntityId == entity.Id && (x.IsRefDisplayField || x.IsRefValueField));
            _refDisplayField = RefField.First(X => X.IsRefDisplayField).FieldName;
        }

        public async Task RenderSuggestion()
        {
            var position = _input.GetBoundingClientRect();
            var headers = RefField.Select(x => new Header<object>()
                {
                    FieldName = x.FieldName,
                    HeaderText = x.ShortDesc
                }).ToArray();
            _source.Data = _masterData.GetSourceByTypeName(_refEntity).ToArray();
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
            Window.SetTimeout(async () =>
            {
                _masterData = await MasterData.GetSingletonAsync();
                var source = _masterData.GetSourceByTypeName(_refEntity);
                var selected = source.FirstOrDefault(x => x["Id"]?.ToString() == _value.Data.ToString());
                _text.Data = selected?[_refDisplayField]?.ToString();
            });
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
