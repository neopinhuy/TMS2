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
    }
}
