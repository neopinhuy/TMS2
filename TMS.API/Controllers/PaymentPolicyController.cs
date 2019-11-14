using Microsoft.AspNetCore.Mvc;
using Nest;
using TMS.API.Models;

namespace TMS.API.Controllers
{
    [Route("api/[controller]")]
    public class PaymentPolicyController : GenericController<PaymentPolicy>
    {
        public PaymentPolicyController(TMSContext context, IElasticClient client) : base(context, client)
        {
        }
    }
}
