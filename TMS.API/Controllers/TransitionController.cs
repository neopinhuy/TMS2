using Microsoft.AspNetCore.Mvc;
using Nest;
using TMS.API.Models;

namespace TMS.API.Controllers
{
    
    public class TransitionController : GenericController<Transition>
    {
        public TransitionController(TMSContext context, IElasticClient client) : base(context, client)
        {
        }
    }
}
