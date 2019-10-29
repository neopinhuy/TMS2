using Bridge;
using Bridge.Html5;
using Common.Extensions;
using MVVM;
using Retyped;
using static Retyped.jquery;

namespace Components.Extensions
{
    public static class MaskMoneyExtension
    {
        [Template("<self>{jq}.maskMoney({methodName}, {defaultValue})")]
        public static JQuery<TElement> MaskMoney<TElement>(this JQuery<TElement> jq, string methodName = "mask", double? defaultValue = null)
        {
            return jq;
        }

        [Template("<self>{jq}.maskMoney({options})")]
        public static JQuery<TElement> MaskMoney<TElement>(this JQuery<TElement> jq, jquery_maskmoney.jQueryMaskMoney.Options options)
        {
            return jq;
        }

        public static Html MaskMoney(this Html html, Observable<decimal?> observable, string align = "left")
        {
            html.Input.ClassName("input-small " + align).Attr("data-role", "input");
            var input = Html.Context as HTMLInputElement;
            input.Value = observable.Data?.ToString();
            jQuery.select(input).MaskMoney(new jquery_maskmoney.jQueryMaskMoney.Options {
                thousands = ".", @decimal = ","
            });
            jQuery.select(input).MaskMoney("mask");
            html.Event(EventType.Input, () =>
            {
                var parsed = decimal.TryParse(input.Value.Replace(".", "").Replace(",", "."), out decimal value);
                if (!parsed || input.Value.IsNullOrEmpty()) observable.Data = null;
                observable.Data = value;
            });
            observable.Subscribe(arg =>
            {
                input.Value = arg.NewData?.ToString();
                jQuery.select(input).MaskMoney("mask");
            });
            return html;
        }
    }
}
