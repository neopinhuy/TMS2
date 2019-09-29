using System;
using System.Collections.Generic;
using System.Threading.Tasks;
using Bridge.Html5;
using LogContract.Interfaces;
using Newtonsoft.Json;

namespace LogOne.APIClients
{
    public class BaseClient<T> : IRestful<T> where T : class
    {
        public string BaseUrl { get; set; }
        public BaseClient()
        {
            BaseUrl = "https://localhost:44331";
        }
        public BaseClient(string url)
        {
            BaseUrl = url;
        }
        public async Task<IEnumerable<T>> Get()
        {
            var type = typeof(T);
            var tcs = new TaskCompletionSource<IEnumerable<T>>();
            var xhr = new XMLHttpRequest();
            xhr.Open("GET", $"{BaseUrl}/api/{type.Name}", true);
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
            return await tcs.Task;
        }

        public async Task<T> Get(int id)
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
            return await tcs.Task;
        }

        public Task Post(T value)
        {
            throw new NotImplementedException();
        }

        public Task Put(T value)
        {
            throw new NotImplementedException();
        }

        public Task Delete(int id)
        {
            throw new NotImplementedException();
        }
    }
}
