using Microsoft.AspNetCore.Mvc;
using Nest;
using TMS.API.Models;

namespace TMS.API.Controllers
{
    
    public class FuelTypeController : GenericController<FuelType>
    {
        public FuelTypeController(TMSContext context, IElasticClient client) : base(context, client)
        {
        }
    }
}
