using Common.ViewModels;
using Microsoft.AspNet.OData.Query;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Nest;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using TMS.API.Models;

namespace TMS.API.Controllers
{
    public class CustomerController : GenericController<Customer>
    {
        public CustomerController(TMSContext context, IElasticClient client) : base(context, client)
        {
        }

        [HttpPut("api/[Controller]")]
        public override async Task<ActionResult<Customer>> UpdateAsync([FromBody] Customer entity)
        {
            if (entity == null || !ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }
            db.Set<Customer>().Attach(entity);
            db.Entry(entity).State = EntityState.Modified;
            db.Set<User>().Attach(entity.User);
            db.Entry(entity.User).State = EntityState.Modified;
            await db.SaveChangesAsync();
            return entity;
        }

        [HttpGet("api/[Controller]/ImportCustomerCareWarning")]
        public async Task<IActionResult> ImportCustomerCareWarning()
        {
            var setting = await db.MasterData.FirstOrDefaultAsync(m => m.Name == "CustomerCareWarning");
            var initStatus = await db.MasterData.FirstOrDefaultAsync(m => m.Name == "UnreadStatus"
                                                                       && m.Parent.Name == "LiabilitiesWarningStatus");
            var parsed = int.TryParse(setting.Description, out int res);
            DateTime today = new DateTime(DateTime.Now.Year, DateTime.Now.Month, DateTime.Now.Day, 00, 00, 00, 000);
            DateTime commingtoday = new DateTime(DateTime.Now.Year, DateTime.Now.Month, DateTime.Now.Day, 23, 59, 59, 999);
            var commingDate = today.AddDays(parsed ? res : 3);
            var dataWarning =
                from cus in db.Customer
                from t in db.CustomerCareWarning.Where(x => x.CustomerId == cus.Id).DefaultIfEmpty()
                where cus.LastContactDate <= commingDate && cus.LastContactDate >= today
                                                    && t == null && cus.Active== true
                select cus;
            var list = await dataWarning.ToListAsync();
            var warning = list.Select(x => new CustomerCareWarning
            {

                CustomerId = x.Id,
                LastContactDate = x.LastContactDate,
                Note = x.Note,
                ProcessStatusId = initStatus.Id
            });
            db.CustomerCareWarning.AddRange(warning);
            await db.SaveChangesAsync();
            return Ok(true);
        }
        [HttpGet("api/[Controller]/CountCustomerWarning")]
        public async Task<ActionResult<int>> CountCustomerWarning()
        {

            var initStatus = await db.MasterData.FirstOrDefaultAsync(m => m.Name == "UnreadStatus"
                                                                       && m.Parent.Name == "LiabilitiesWarningStatus");
            var dataCount = from cus in db.CustomerCareWarning
                            where cus.ProcessStatusId == initStatus.Id
                            select cus;
            var count = await dataCount.CountAsync();
            return Ok(count);
        }
    }
}
