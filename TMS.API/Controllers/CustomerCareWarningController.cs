using Microsoft.AspNetCore.Mvc;
using Nest;
using TMS.API.Models;


namespace TMS.API.Controllers
{
    public class CustomerCareWarningController : GenericController<CustomerCareWarning>
    {
        public CustomerCareWarningController(TMSContext context, IElasticClient client) : base(context, client)
        {
        }
    }
}