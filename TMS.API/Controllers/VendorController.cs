using Microsoft.AspNetCore.Mvc;
using Nest;
using TMS.API.Models;

namespace TMS.API.Controllers
{
    
    public class VendorController : GenericController<Vendor>
    {
        public VendorController(TMSContext context, IElasticClient client) : base(context, client)
        {
        }
    }
}
