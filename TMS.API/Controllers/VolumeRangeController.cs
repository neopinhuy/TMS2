using Microsoft.AspNetCore.Mvc;
using Nest;
using TMS.API.Models;

namespace TMS.API.Controllers
{
    [Route("api/[controller]")]
    public class VolumeRangeController : GenericController<VolumeRange>
    {
        public VolumeRangeController(TMSContext context, IElasticClient client) : base(context, client)
        {
        }
    }
}
