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
    }
}
