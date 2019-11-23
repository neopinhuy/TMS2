using Microsoft.AspNetCore.Mvc;
using Nest;
using System.Linq;
using System.Threading.Tasks;
using TMS.API.Models;

namespace TMS.API.Controllers
{
    public class OrderController : GenericController<Order>
    {
        public OrderController(TMSContext context, IElasticClient client) : base(context, client)
        {
        }

        [HttpPut("api/[Controller]")]
        public override async Task<ActionResult<Order>> PutAsync([FromBody]Order order)
        {
            if (order == null || !ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }
            order.OrderDetail = order.OrderDetail.Where(x => x.Id >= 0).ToList();
            UpdateChildren<OrderDetail>(order);
            return await base.PutAsync(order);
        }
    }
}
