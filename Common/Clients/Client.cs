using System;
using System.Collections.Generic;
using System.Threading.Tasks;
using Bridge.Html5;
using Common.Extensions;
using Newtonsoft.Json;
using TMS.API.Models;

namespace Common.Clients
{
    public class Client
    {
        private readonly string _entityName;
        public Client(string entityName)
        {
            _entityName = entityName ?? throw new ArgumentNullException(nameof(entityName));
        }

        public Task<OdataResult<object>> GetList(string filter = null)
        {
            var tcs = new TaskCompletionSource<OdataResult<object>>();
            var xhr = new XMLHttpRequest();
            xhr.Open("GET", $"/api/{_entityName}/{filter}", true);
            xhr.OnReadyStateChange = () =>
            {
                if (xhr.ReadyState != AjaxReadyState.Done)
                {
                    return;
                }

                if (xhr.Status == 200 || xhr.Status == 204)
                {
                    var parsed = JsonConvert.DeserializeObject<OdataResult<object>>(xhr.ResponseText);
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

        public Task<object> Get(int id)
        {
            var tcs = new TaskCompletionSource<object>();
            var xhr = new XMLHttpRequest();
            xhr.Open("GET", $"/api/{_entityName}/{id}", true);
            xhr.OnReadyStateChange = () =>
            {
                if (xhr.ReadyState != AjaxReadyState.Done)
                {
                    return;
                }

                if (xhr.Status == 200 || xhr.Status == 204)
                {
                    var parsed = JsonConvert.DeserializeObject<object>(xhr.ResponseText);
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

        public Task<int?> Count(string filter)
        {
            var tcs = new TaskCompletionSource<int?>();
            var xhr = new XMLHttpRequest();
            xhr.Open("GET", $"/api/{_entityName}/count/{filter}", true);
            xhr.OnReadyStateChange = () =>
            {
                if (xhr.ReadyState != AjaxReadyState.Done)
                {
                    return;
                }

                if (xhr.Status == 200 || xhr.Status == 204)
                {
                    var parsed = JsonConvert.DeserializeObject<int?>(xhr.ResponseText);
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
        public Task<object> CreateAsync(object value)
        {
            var tcs = new TaskCompletionSource<object>();
            var xhr = new XMLHttpRequest();
            xhr.Open("POST", $"/api/{_entityName}", true);
            xhr.SetRequestHeader("Content-type", "application/json-patch+json");
            xhr.OnReadyStateChange = () =>
            {
                if (xhr.ReadyState != AjaxReadyState.Done)
                {
                    return;
                }

                if (xhr.Status == 200 || xhr.Status == 204)
                {
                    var parsed = JsonConvert.DeserializeObject<object>(xhr.ResponseText);
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
            xhr.Open("POST", $"/api/File", true);
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
        public Task<object> UpdateAsync(object value)
        {
            var tcs = new TaskCompletionSource<object>();
            var xhr = new XMLHttpRequest();
            xhr.Open("PUT", $"/api/{_entityName}", true);
            xhr.SetRequestHeader("Content-type", "application/json-patch+json");
            xhr.OnReadyStateChange = () =>
            {
                if (xhr.ReadyState != AjaxReadyState.Done)
                {
                    return;
                }

                if (xhr.Status == 200 || xhr.Status == 204)
                {
                    var parsed = JsonConvert.DeserializeObject<object>(xhr.ResponseText);
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

        public Task<bool> Delete(List<int> ids)
        {
            var tcs = new TaskCompletionSource<bool>();
            var xhr = new XMLHttpRequest();
            xhr.Open("POST", $"/api/{_entityName}/Delete", true);
            xhr.SetRequestHeader("Content-type", "application/json-patch+json");
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
                    Toast.Warning(xhr.ResponseText);
                }
            };
            xhr.Send(JsonConvert.SerializeObject(ids));
            return tcs.Task;
        }
    }
}
