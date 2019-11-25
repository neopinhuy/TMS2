using Nest;
using TMS.API.Models;

namespace TMS.API.Controllers
{
    public class OrderDetailController : GenericController<OrderDetail>
    {
        public OrderDetailController(TMSContext context, IElasticClient client) : base(context, client)
        {
        }
    }
}
