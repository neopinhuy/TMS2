using Microsoft.AspNetCore.Mvc;
using Nest;
using TMS.API.Models;

namespace TMS.API.Controllers
{
    [Route("api/[controller]")]
    public class UomTypeController : GenericController<UomType>
    {
        public UomTypeController(TMSContext context, IElasticClient client) : base(context, client)
        {

        }
    }
}
