using Microsoft.AspNetCore.Mvc;
using Nest;
using TMS.API.Models;

namespace TMS.API.Controllers
{
    
    public class AccessoryController : GenericController<Accessory>
    {
        public AccessoryController(TMSContext context, IElasticClient client) : base(context, client)
        {
        }
    }
}
