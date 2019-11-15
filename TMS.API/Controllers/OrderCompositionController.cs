using Microsoft.AspNetCore.Mvc;
using Nest;
using TMS.API.Models;

namespace TMS.API.Controllers
{
    
    public class OrderCompositionController : GenericController<OrderComposition>
    {
        public OrderCompositionController(TMSContext context, IElasticClient client) : base(context, client)
        {
        }
    }
}
