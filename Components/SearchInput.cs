using Bridge.Html5;
using MVVM;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Components
{
    public class SearchInput<Key, Ref> : Component
    {
        private readonly Observable<Key> _value;
        private readonly Observable<string> _text = new Observable<string>();
        private readonly ObservableArray<Ref> _searchFound = new ObservableArray<Ref>();
        private readonly List<Header<Ref>> _header;
        private FloatingTable<Ref> _table;
        private MasterData _masterData;
        private HTMLInputElement _input;
        public string DisplayField { get; set; } = "Name";
        public string ValueField { get; set; } = "Id";

        public SearchInput(Observable<Key> value, List<Header<Ref>> header)
        {
            _value = value;
            _header = header;
        }

        public override async Task RenderAsync()
        {
            Html.Instance.SmallInput(_text)
                .AsyncEvent(EventType.Focus, RenderSuggestion)
                .Event(EventType.Blur, DestroySuggestion)
                .Event(EventType.KeyDown, (Event e) => {
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

        private void UpdateSearchText()
        {
            Window.SetTimeout(async () =>
            {
                _masterData = await MasterData.GetSingletonAsync();
                var source = _masterData.GetSourceByType(typeof(Ref));
                var selected = source.FirstOrDefault(x => x["Id"]?.ToString() == _value.Data?.ToString());
                _text.Data = selected?[DisplayField]?.ToString();
            });
        }

        public async Task RenderSuggestion()
        {
            var position = _input.GetBoundingClientRect();
            _masterData = await MasterData.GetSingletonAsync();
            _searchFound.Data = _masterData.GetSourceByType(typeof(Ref)).As<IEnumerable<Ref>>().ToArray();
            var headers = new ObservableArray<Header<Ref>>(_header.ToArray());
            _table = new FloatingTable<Ref>(headers, _searchFound)
            {
                Top = position.Bottom,
                Left = position.Left - 1
            };
            Html.Take(Document.Body);
            await _table.RenderAsync();
        }

        public void DestroySuggestion()
        {
            _table.Dispose();
        }
    }
}
