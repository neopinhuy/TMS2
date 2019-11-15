using Microsoft.AspNetCore.Mvc;
using Nest;
using TMS.API.Models;

namespace TMS.API.Controllers
{
    
    public class OperationTypeController : GenericController<OperationType>
    {
        public OperationTypeController(TMSContext context, IElasticClient client) : base(context, client)
        {
        }
    }
}
