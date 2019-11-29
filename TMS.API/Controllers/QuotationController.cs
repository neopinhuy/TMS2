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
                join cGroup in db.CustomerGroup on customer.CustomerGroupId equals cGroup.Id
                from quo in db.Quotation
                    .Where(x => x.CustomerGroupId == cGroup.Id || x.CustomerId == customer.Id)
                    .DefaultIfEmpty()
                where customer.Id == customerId
                select quo;

            var appliedQuery = options.ApplyTo(query) as IQueryable<Quotation>;
            var result = await appliedQuery.ToListAsync();
            return Ok(new OdataResult<Quotation>
            {
                Value = result,
                Odata = new Odata
                {
                    Count = options.Count?.Value == true ? query.Count() : 0
                }
            });
        }
    }
}
