using Microsoft.AspNetCore.Mvc;
using Nest;
using TMS.API.Models;


namespace TMS.API.Controllers
{
    public class LiabilitiesWarningController : GenericController<LiabilitiesWarning>
    {
        public LiabilitiesWarningController(TMSContext context, IElasticClient client) : base(context, client)
        {
        }
    }
}