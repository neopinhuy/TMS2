using Microsoft.AspNet.OData.Query;
using Microsoft.AspNetCore.Mvc;
using Nest;
using System.Threading.Tasks;
using TMS.API.Models;
using System.Linq;
using Microsoft.EntityFrameworkCore;

namespace TMS.API.Controllers
{
    public class QuotationController : GenericController<Quotation>
    {
        public QuotationController(TMSContext context, IElasticClient client) : base(context, client)
        {
        }

        [HttpGet("api/[Controller]/Customer/{customerId}")]
        public virtual async Task<IActionResult> GetByCustomer(int customerId, ODataQueryOptions<Quotation> options)
        {
            var query =
                from customer in db.Customer
                join cGroup in db.MasterData on customer.CustomerGroupId equals cGroup.Id
                from quo in db.Quotation
                    .Where(x => x.CustomerGroupId == cGroup.Id || x.CustomerId == customer.Id)
                    .DefaultIfEmpty()
                where customer.Id == customerId
                select quo;

            return await ApplyCustomQuery(options, query);
        }
    }
}
