using Microsoft.AspNetCore.Mvc;
using Nest;
using TMS.API.Models;

namespace TMS.API.Controllers
{
    [Route("api/[controller]")]
    public class OrderController : GenericController<Order>
    {
        public OrderController(TMSContext context, IElasticClient client) : base(context, client)
        {
        }
    }
}
