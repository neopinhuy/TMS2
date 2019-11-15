using Microsoft.AspNetCore.Mvc;
using Nest;
using TMS.API.Models;

namespace TMS.API.Controllers
{
    
    public class NationalityController : GenericController<Nationality>
    {
        public NationalityController(TMSContext context, IElasticClient client) : base(context, client)
        {
        }
    }
}
