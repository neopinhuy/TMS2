using Microsoft.AspNet.OData;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using TMS.API.Models;

namespace TMS.API.Controllers
{
    [Route("api/[controller]")]
    public class BranchController : BaseController
    {
        readonly TMSContext db;

        public BranchController(TMSContext context)
        {
            db = context;
        }

        [HttpGet]
        [EnableQuery]
        public IQueryable<Branch> Get()
        {
            return db.Branch.AsQueryable();
        }

        [HttpGet("{id}")]
        public async Task<ActionResult<Branch>> Get(int id)
        {
            var branch = await db.Branch.FindAsync(id);
            if (branch == null) return NotFound();
            return Ok(branch);
        }

        [HttpPost]
        public async Task<ActionResult<Branch>> PostAsync([FromBody]Branch branch)
        {
            if (branch == null || !ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }
            db.Branch.Add(branch);
            await db.SaveChangesAsync();
            return branch;
        }

        [HttpPut]
        public async Task<Branch> PutAsync([FromBody]Branch branch)
        {
            db.Branch.Attach(branch);
            db.Entry(branch).State = EntityState.Modified;
            await db.SaveChangesAsync();
            return branch;
        }

        [HttpPost("Delete")]
        public async Task<bool> Delete([FromBody]List<int> ids)
        {
            var branch = db.Branch.Where(x => ids.Contains(x.Id));
            db.Branch.RemoveRange(branch);
            await db.SaveChangesAsync();
            return true;
        }
    }
}
