using Bridge.Html5;
using Common.Extensions;
using Newtonsoft.Json;

namespace Components.Extensions
{
    public static class ComponentExtensions
    {
        public static void DispatchEvent(this Component com, string events, EventType eventType, params object[] parameters)
        {
            if (events.IsNullOrEmpty()) return;
            var eventObj = JsonConvert.DeserializeObject<object>(events);
            var changeEvent = eventObj[eventType.ToString()]?.ToString();
            if (changeEvent.IsNullOrEmpty()) return;
            com.FindComponentEvent(changeEvent)?.ExecuteEvent(changeEvent, parameters);
        }

        public static TMS.API.Models.Component MapToComponent<T>(this Header<T> header, object Entity)
        {
            return new TMS.API.Models.Component
            {
                Reference = new TMS.API.Models.Entity { Name = header.Reference },
                FormatData = header.FormatCell,
                FormatEntity = header.FormatRow,
                DataSourceFilter = Utils.FormatWith(header.DataSource, Entity),
                FieldName = header.FieldName,
                Precision = header.Precision,
                Validation = header.Validation,
                PopulateField = header.PopulateField,
                CascadeField = header.CascadeField,
            };
        }
    }
}
