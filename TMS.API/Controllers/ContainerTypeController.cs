using Microsoft.AspNetCore.Mvc;
using TMS.API.Models;

namespace TMS.API.Controllers
{
    [Route("api/[controller]")]
    public class ContainerTypeController : GenericController<ContainerType>
    {
        public ContainerTypeController(TMSContext context) : base(context)
        {
        }
    }
}
