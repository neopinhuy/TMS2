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
        private MasterData _masterData;
        public string DisplayField { get; set; } = "Name";
        public string ValueField { get; set; } = "Id";

        public SearchInput(Observable<Key> value, List<Header<Ref>> header)
        {
            _value = value;
            _header = header;
        }

        public override async Task RenderAsync()
        {
            Html.Instance.SmallInput(_text).AsyncEvent(EventType.FocusIn, RenderSuggestion);
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
                _masterData = await MasterData.GetInstanceAsync();
                var source = _masterData.GetSourceByType(typeof(Ref));
                var selected = source.FirstOrDefault(x => x["Id"]?.ToString() == _value.Data?.ToString());
                _text.Data = selected?[DisplayField]?.ToString();
            });
        }

        public async Task RenderSuggestion()
        {
            _masterData = await MasterData.GetInstanceAsync();
            _searchFound.Data = _masterData.GetSourceByType(typeof(Ref)).As<IEnumerable<Ref>>().ToArray();
            var table = new Table<Ref>(new ObservableArray<Header<Ref>>(_header.ToArray()), _searchFound);
            await table.RenderAsync();
        }
    }
}
