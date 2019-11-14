using Microsoft.AspNetCore.Mvc;
using Nest;
using TMS.API.Models;

namespace TMS.API.Controllers
{
    [Route("api/[controller]")]
    public class MaintenanceTicketController : GenericController<MaintenanceTicket>
    {
        public MaintenanceTicketController(TMSContext context, IElasticClient client) : base(context, client)
        {
        }
    }
}
