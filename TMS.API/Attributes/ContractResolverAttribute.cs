using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Filters;
using Microsoft.AspNetCore.Mvc.Formatters;
using Newtonsoft.Json.Serialization;
using System;
using System.Buffers;
using TMS.API.Extensions;

namespace TMS.API.Attributes
{
    [AttributeUsage(AttributeTargets.Class | AttributeTargets.Method)]
    public sealed class ContractResolverAttribute : ActionFilterAttribute
    {
        public bool AllowNested { get; set; }
        public ContractResolverAttribute()
        {
        }

        public override void OnActionExecuted(ActionExecutedContext context)
        {
            if (context == null || context.Result == null)
            {
                return;
            }

            var settings = JsonSerializerSettingsProvider.CreateSerializerSettings();
            if (AllowNested)
                settings.ContractResolver = new IgnoreNullOrEmptyEnumResolver();
            else
                settings.ContractResolver = new IgnoreNestedResolver();
            var formatter = new JsonOutputFormatter(settings, ArrayPool<char>.Shared);
            var okResult = context.Result as ObjectResult;
            okResult.Formatters.Add(formatter);
        }
    }
}
