using Microsoft.AspNetCore.Mvc;
using Nest;
using TMS.API.Models;

namespace TMS.API.Controllers
{
    
    public class WorkflowController : GenericController<Workflow>
    {
        public WorkflowController(TMSContext context, IElasticClient client) : base(context, client)
        {
        }
    }
}
