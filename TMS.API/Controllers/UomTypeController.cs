using Microsoft.AspNetCore.Mvc;
using Nest;
using TMS.API.Models;

namespace TMS.API.Controllers
{
    
    public class UomTypeController : GenericController<UomType>
    {
        public UomTypeController(TMSContext context, IElasticClient client) : base(context, client)
        {

        }
    }
}
