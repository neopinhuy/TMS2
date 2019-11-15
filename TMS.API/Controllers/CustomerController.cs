using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Nest;
using System.Threading.Tasks;
using TMS.API.Models;

namespace TMS.API.Controllers
{
    
    public class CustomerController : GenericController<Customer>
    {
        public CustomerController(TMSContext context, IElasticClient client) : base(context, client)
        {
        }

        public override async Task<ActionResult<Customer>> PostAsync([FromBody] Customer entity)
        {
            if (entity == null || !ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }
            db.Customer.Add(entity);
            db.User.Add(entity.User);
            await db.SaveChangesAsync();
            return entity;
        }

        public override async Task<ActionResult<Customer>> PutAsync([FromBody] Customer entity)
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
    }
}
