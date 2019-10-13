using Bridge.Html5;
using MVVM;
using System;
using System.Linq;

namespace Components
{
    public class SearchInput<Key> : Component
    {
        readonly Observable<Key> _value;
        Observable<string> Text { get; set; } = new Observable<string>();
        readonly Type _refType;
        MasterData _masterData;
        public string DisplayField { get; set; } = "Name";
        public string ValueField { get; set; } = "Id";

        public SearchInput(Observable<Key> value, Type refType)
        {
            _value = value;
            _refType = refType;

        }

        public override string Title { get; set; }

        public override void Render()
        {
            Html.Instance.SmallInput(Text);
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
                var source = _masterData.GetSourceByType(_refType);
                var selected = source.FirstOrDefault(x => x["Id"]?.ToString() == _value.Data?.ToString());
                Text.Data = selected?[DisplayField]?.ToString();
            });
        }

        public void RenderSuggestion()
        {
            
        }
    }
}
