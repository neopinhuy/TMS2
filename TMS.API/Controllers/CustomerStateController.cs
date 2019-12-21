using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Nest;
using System.Threading.Tasks;
using TMS.API.Models;

namespace TMS.API.Controllers
{
    public class CustomerStateController : GenericController<CustomerState>
    {
        public CustomerStateController(TMSContext context, IElasticClient client) : base(context, client)
        {
        }
    }
}
