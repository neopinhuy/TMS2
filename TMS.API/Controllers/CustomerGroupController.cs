using Microsoft.AspNetCore.Mvc;
using Nest;
using TMS.API.Models;

namespace TMS.API.Controllers
{
    
    public class CustomerGroupController : GenericController<CustomerGroup>
    {
        public CustomerGroupController(TMSContext context, IElasticClient client) : base(context, client)
        {
        }
    }
}
