using Microsoft.AspNetCore.Mvc;
using Nest;
using TMS.API.Models;

namespace TMS.API.Controllers
{
    
    public class TruckTypeController : GenericController<TruckType>
    {
        public TruckTypeController(TMSContext context, IElasticClient client) : base(context, client)
        {
        }
    }
}
