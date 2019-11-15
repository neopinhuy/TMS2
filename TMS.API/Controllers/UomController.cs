using Microsoft.AspNetCore.Mvc;
using Nest;
using TMS.API.Models;

namespace TMS.API.Controllers
{
    
    public class UomController : GenericController<UoM>
    {
        public UomController(TMSContext context, IElasticClient client) : base(context, client)
        {

        }
    }
}
