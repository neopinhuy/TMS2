using Microsoft.AspNetCore.Mvc;
using Nest;
using System.Threading.Tasks;
using TMS.API.Models;

namespace TMS.API.Controllers
{
    public class OrderController : GenericController<Order>
    {
        public OrderController(TMSContext context, IElasticClient client) : base(context, client)
        {
        }

        [HttpPost("api/[Controller]")]
        public override async Task<ActionResult<Order>> CreateAsync([FromBody]Order order)
        {
            if (order == null || !ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }
            return await base.CreateAsync(order);
        }

        [HttpPut("api/[Controller]")]
        public override async Task<ActionResult<Order>> UpdateAsync([FromBody]Order order)
        {
            if (order == null || !ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }
            UpdateChildren<OrderDetail>(order);
            return await base.UpdateAsync(order);
        }
    }
}
