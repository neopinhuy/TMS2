using System;
using System.Collections.Generic;
using System.Threading.Tasks;
using Bridge.Html5;
using Newtonsoft.Json;

namespace Common.Clients
{
    public class BaseClient<T>
    {
        public string BaseUrl { get; set; }
        public BaseClient()
        {
        }

        public BaseClient(string url)
        {
            BaseUrl = url;
        }

        public Task<List<T>> GetList(string filter = null)
        {
            filter = filter ?? "$filter=Active eq true";
            var type = typeof(T);
            var tcs = new TaskCompletionSource<List<T>>();
            var xhr = new XMLHttpRequest();
            xhr.Open("GET", $"{BaseUrl}/api/{type.Name}?{filter}", true);
            xhr.OnReadyStateChange = () =>
            {
                if (xhr.ReadyState != AjaxReadyState.Done)
                {
                    return;
                }

                if (xhr.Status == 200 || xhr.Status == 204)
                {
                    var parsed = JsonConvert.DeserializeObject<List<T>>(xhr.ResponseText);
                    tcs.SetResult(parsed);
                }
                else
                {
                    tcs.SetException(new Exception("Response status code does not indicate success: " + xhr.StatusText));
                }
            };
            xhr.Send();
            return tcs.Task;
        }

        public Task<T> Get(int id)
        {
            var type = typeof(T);
            var tcs = new TaskCompletionSource<T>();
            var xhr = new XMLHttpRequest();
            xhr.Open("GET", $"{BaseUrl}/api/{type.Name}/{id}", true);
            xhr.OnReadyStateChange = () =>
            {
                if (xhr.ReadyState != AjaxReadyState.Done)
                {
                    return;
                }

                if (xhr.Status == 200 || xhr.Status == 204)
                {
                    var parsed = JsonConvert.DeserializeObject<T>(xhr.ResponseText);
                    tcs.SetResult(parsed);
                }
                else
                {
                    tcs.SetException(new Exception("Response status code does not indicate success: " + xhr.StatusText));
                }
            };
            xhr.Send();
            return tcs.Task;
        }

        public Task<T> PostAsync(T value)
        {
            var type = typeof(T);
            var tcs = new TaskCompletionSource<T>();
            var xhr = new XMLHttpRequest();
            xhr.Open("POST", $"{BaseUrl}/api/{type.Name}", true);
            xhr.SetRequestHeader("Content-type", "application/json-patch+json");
            xhr.OnReadyStateChange = () =>
            {
                if (xhr.ReadyState != AjaxReadyState.Done)
                {
                    return;
                }

                if (xhr.Status == 200 || xhr.Status == 204)
                {
                    var parsed = JsonConvert.DeserializeObject<T>(xhr.ResponseText);
                    tcs.SetResult(parsed);
                }
                else
                {
                    tcs.SetException(new Exception("Response status code does not indicate success: " + xhr.StatusText));
                }
            };
            xhr.Send(JsonConvert.SerializeObject(value));
            return tcs.Task;
        }

        public Task<T> PutAsync(T value)
        {
            var type = typeof(T);
            var tcs = new TaskCompletionSource<T>();
            var xhr = new XMLHttpRequest();
            xhr.Open("PUT", $"{BaseUrl}/api/{type.Name}", true);
            xhr.SetRequestHeader("Content-type", "application/json-patch+json");
            xhr.OnReadyStateChange = () =>
            {
                if (xhr.ReadyState != AjaxReadyState.Done)
                {
                    return;
                }

                if (xhr.Status == 200 || xhr.Status == 204)
                {
                    var parsed = JsonConvert.DeserializeObject<T>(xhr.ResponseText);
                    tcs.SetResult(parsed);
                }
                else
                {
                    tcs.SetException(new Exception("Response status code does not indicate success: " + xhr.StatusText));
                }
            };
            xhr.Send(JsonConvert.SerializeObject(value));
            return tcs.Task;
        }

        public Task<bool> Delete(int id)
        {
            var type = typeof(T);
            var tcs = new TaskCompletionSource<bool>();
            var xhr = new XMLHttpRequest();
            xhr.Open("DELETE", $"{BaseUrl}/api/{type.Name}/{id}", true);
            xhr.SetRequestHeader("Content-type", "application/json");
            xhr.OnReadyStateChange = () =>
            {
                if (xhr.ReadyState != AjaxReadyState.Done)
                {
                    return;
                }
                if (xhr.Status == 200 || xhr.Status == 204)
                {
                    var parsed = JsonConvert.DeserializeObject<bool>(xhr.ResponseText);
                    tcs.SetResult(parsed);
                }
                else
                {
                    tcs.SetException(new Exception("Response status code does not indicate success: " + xhr.StatusText));
                }
            };
            xhr.Send();
            return tcs.Task;
        }
    }
}
