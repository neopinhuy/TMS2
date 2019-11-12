using System;
using System.Collections.Generic;
using System.Threading.Tasks;
using Bridge.Html5;
using Newtonsoft.Json;

namespace Common.Clients
{
    public class Client<T> where T : class
    {
        public string BaseUrl { get; set; }
        public Client()
        {
        }

        public Client(string url)
        {
            BaseUrl = url;
        }

        public static Client<T> Instance => new Client<T>();

        public Task<List<T>> GetList(string filter = null)
        {
            var type = typeof(T);
            var tcs = new TaskCompletionSource<List<T>>();
            var xhr = new XMLHttpRequest();
            xhr.Open("GET", $"{BaseUrl}/api/{type.Name}{filter}", true);
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
                    tcs.SetResult(null);
                }
            };
            xhr.Send();
            return tcs.Task;
        }

        public Task<List<object>> GetListEntity(string entity, string filter = null)
        {
            var refType = Type.GetType("TMS.API.Models." + entity);
            var clientType = typeof(Client<>).MakeGenericType(new Type[] { refType });
            var httpGetList = clientType.GetMethod("GetList");
            var client = Activator.CreateInstance(clientType);
            return httpGetList.Invoke(client, filter).As<Task<List<object>>>();
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
                    tcs.SetResult(null);
                }
            };
            xhr.Send();
            return tcs.Task;
        }

        /// <summary>
        /// Create entity
        /// </summary>
        /// <param name="value"></param>
        /// <returns></returns>
        public Task<T> CreateAsync(T value)
        {
            var type = typeof(T);
            var tcs = new TaskCompletionSource<T>();
            var xhr = new XMLHttpRequest();
            xhr.Open("POST", $"{BaseUrl}/api/{type.Name}", true);
            xhr.SetRequestHeader("Content-type", "application/json");
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
                    tcs.SetResult(null);
                }
            };
            xhr.Send(JsonConvert.SerializeObject(value));
            return tcs.Task;
        }

        /// <summary>
        /// Upload files
        /// </summary>
        /// <param name="value">Path of uploaded image</param>
        /// <returns></returns>
        public Task<List<string>> PostFilesAsync(FormData value, Action progressHandler = null)
        {
            var tcs = new TaskCompletionSource<List<string>>();
            var xhr = new XMLHttpRequest();
            xhr.Open("POST", $"{BaseUrl}/api/File", true);
            xhr.AddEventListener(EventType.ReadyStateChange, () =>
            {
                if (xhr.ReadyState != AjaxReadyState.Done)
                {
                    return;
                }
                if (xhr.Status == 200 || xhr.Status == 204)
                {
                    var parsed = JsonConvert.DeserializeObject<List<string>>(xhr.ResponseText);
                    tcs.SetResult(parsed);
                }
                else
                {
                    tcs.SetResult(null);
                }
            });
            xhr.AddEventListener(EventType.Progress, progressHandler);
            xhr.Send(value);
            return tcs.Task;
        }

        /// <summary>
        /// Update entity
        /// </summary>
        /// <param name="value"></param>
        /// <returns></returns>
        public Task<T> UpdateAsync(T value)
        {
            var type = typeof(T);
            var tcs = new TaskCompletionSource<T>();
            var xhr = new XMLHttpRequest();
            xhr.Open("PUT", $"{BaseUrl}/api/{type.Name}", true);
            xhr.SetRequestHeader("Content-type", "application/json");
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
                    tcs.SetResult(null);
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
                    tcs.SetResult(false);
                }
            };
            xhr.Send();
            return tcs.Task;
        }
    }
}
