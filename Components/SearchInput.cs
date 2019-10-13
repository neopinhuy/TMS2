using Bridge.Html5;
using MVVM;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Components
{
    public class SearchInput<Key> : Component
    {
        Observable<Key> _value;
        Type _refType;
        MasterData _masterData;

        public SearchInput(Observable<Key> value, Type refType)
        {
            _value = value;
            _refType = refType;
        }

        public override string Title { get; set; }

        public override void Render()
        {
            var text = new Observable<string>();
            Html.Instance.SmallInput(text);
            Window.SetTimeout(async () =>
            {
                _masterData = await MasterData.GetInstanceAsync();
            });
        }
    }
}
