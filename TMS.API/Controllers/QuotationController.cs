using Microsoft.AspNet.OData.Query;
using Microsoft.AspNetCore.Mvc;
using Nest;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using TMS.API.Models;

namespace TMS.API.Controllers
{
    public class QuotationController : GenericController<Quotation>
    {
        public QuotationController(TMSContext context, IElasticClient client) : base(context, client)
        {
        }

        [HttpGet("api/[Controller]/Customer/{customerId:int?}")]
        public virtual async Task<IActionResult> GetByCustomer(int? customerId, ODataQueryOptions<Quotation> options)
        {
            if (customerId is null) return Ok(new OdataResult<Quotation>
            {
                odata = new Odata() { count = 0 },
                value = new List<Quotation>()
            });
            var query =
                from customer in db.Customer
                join cGroup in db.MasterData on customer.CustomerGroupId equals cGroup.Id
                from quo in db.Quotation
                    .Where(x => x.CustomerGroupId == cGroup.Id || x.CustomerId == customer.Id)
                    .DefaultIfEmpty()
                where customer.Id == customerId && quo != null
                select quo;

            return await ApplyCustomQuery(options, query);
        }
    }
}
