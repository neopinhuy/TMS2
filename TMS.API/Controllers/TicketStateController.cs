using Microsoft.AspNetCore.Mvc;
using Nest;
using TMS.API.Models;

namespace TMS.API.Controllers
{
    
    public class TicketStateController : GenericController<TicketState>
    {
        public TicketStateController(TMSContext context, IElasticClient client) 
            : base(context, client)
        {
        }
    }
}
