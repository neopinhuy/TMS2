using Microsoft.AspNetCore.Mvc;
using Nest;
using TMS.API.Models;

namespace TMS.API.Controllers
{
    
    public class TerminalController : GenericController<Terminal>
    {
        public TerminalController(TMSContext context, IElasticClient client) : base(context, client)
        {
        }
    }
}
