using System;
using System.Collections.Generic;
using System.Threading.Tasks;
using Bridge.Html5;
using Common.Extensions;
using Newtonsoft.Json;
using TMS.API.Models;

namespace Common.Clients
{
    public static class ClientConst
    {
        public static readonly JsonSerializerSettings settings = new JsonSerializerSettings
        {
            NullValueHandling = NullValueHandling.Ignore
        };
    }

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

        public Task<OdataResult<T>> GetList(string filter = null)
        {
            var type = typeof(T);
            var tcs = new TaskCompletionSource<OdataResult<T>>();
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
                    var json = JSON.Parse(xhr.ResponseText);
                    var result = JsonConvert.DeserializeObject<OdataResult<T>>(xhr.ResponseText);
                    result.Odata = new Odata() { Count = (int?)json["@odata.count"] };
                    tcs.SetResult(result);
                }
                else
                {
                    tcs.SetResult(null);
                    Toast.Warning(xhr.ResponseText);
                }
            };
            xhr.Send();
            return tcs.Task;
        }

        public Task<OdataResult<T>> GetListByIds(IEnumerable<int> ids)
        {
            var type = typeof(T);
            var tcs = new TaskCompletionSource<OdataResult<T>>();
            var xhr = new XMLHttpRequest();
            var filter = $"?filter=id in ({string.Join(",", ids)})";
            xhr.Open("GET", $"{BaseUrl}/api/{type.Name}{filter}", true);
            xhr.OnReadyStateChange = () =>
            {
                if (xhr.ReadyState != AjaxReadyState.Done)
                {
                    return;
                }

                if (xhr.Status == 200 || xhr.Status == 204)
                {
                    var json = JSON.Parse(xhr.ResponseText);
                    var result = JsonConvert.DeserializeObject<OdataResult<T>>(xhr.ResponseText);
                    result.Odata = new Odata() { Count = (int?)json["@odata.count"] };
                    tcs.SetResult(result);
                }
                else
                {
                    tcs.SetResult(null);
                    Toast.Warning(xhr.ResponseText);
                }
            };
            xhr.Send();
            return tcs.Task;
        }

        public Task<OdataResult<object>> GetListEntity(string entity, string filter = null)
        {
            var refType = Type.GetType("TMS.API.Models." + entity);
            var clientType = typeof(Client<>).MakeGenericType(new Type[] { refType });
            var httpGetList = clientType.GetMethod("GetList");
            var client = Activator.CreateInstance(clientType);
            return httpGetList.Invoke(client, filter).As<Task<OdataResult<object>>>();
        }

        public Task<T> Get(int id)
        {
            var type = typeof(T);
            var tcs = new TaskCompletionSource<T>();
            if (id <= 0)
            {
                tcs.SetResult(null);
                return tcs.Task;
            }
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
                    Toast.Warning(xhr.ResponseText);
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
                    Toast.Warning(xhr.ResponseText);
                }
            };
            xhr.Send(JsonConvert.SerializeObject(value, ClientConst.settings));
            return tcs.Task;
        }

        /// <summary>
        /// Upload files
        /// </summary>
        /// <param name="value">Path of uploaded image</param>
        /// <returns></returns>
        public Task<List<string>> PostFilesAsync(FormData value, System.Action progressHandler = null)
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
                    Toast.Warning(xhr.ResponseText);
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

                if (xhr.Status == 200)
                {
                    var parsed = JsonConvert.DeserializeObject<T>(xhr.ResponseText);
                    tcs.SetResult(parsed);
                }
                else if (xhr.Status == 204)
                {
                    tcs.SetResult(value);
                }
                else
                {
                    tcs.SetResult(null);
                    Toast.Warning(xhr.ResponseText);
                }
            };
            xhr.Send(JsonConvert.SerializeObject(value, ClientConst.settings));
            return tcs.Task;
        }
    }
}
