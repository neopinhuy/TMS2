using Microsoft.AspNetCore.Mvc;
using Nest;
using TMS.API.Models;

namespace TMS.API.Controllers
{
    
    public class UserInterfaceController : GenericController<UserInterface>
    {
        public UserInterfaceController(TMSContext context, IElasticClient client) : base(context, client)
        {
        }
    }
}
