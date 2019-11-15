using Microsoft.AspNetCore.Mvc;
using Nest;
using TMS.API.Models;

namespace TMS.API.Controllers
{
    
    public class ObjectiveController : GenericController<Objective>
    {
        public ObjectiveController(TMSContext context, IElasticClient client) : base(context, client)
        {
        }
    }
}
