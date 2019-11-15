using Microsoft.AspNetCore.Mvc;
using Nest;
using TMS.API.Models;

namespace TMS.API.Controllers
{
    
    public class QuotationController : GenericController<Quotation>
    {
        public QuotationController(TMSContext context, IElasticClient client) : base(context, client)
        {
        }
    }
}
