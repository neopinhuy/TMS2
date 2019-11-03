using Microsoft.AspNet.OData;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using System.Linq;
using System.Threading.Tasks;
using TMS.API.Models;

namespace TMS.API.Controllers
{
    [Route("api/[controller]")]
    public class GridPolicyController : BaseController
    {
        readonly TMSContext db;

        public GridPolicyController(TMSContext context)
        {
            db = context;
        }

        [HttpGet]
        [EnableQuery]
        public IQueryable<GridPolicy> Get()
        {
            return db.GridPolicy.AsQueryable();
        }

        [HttpGet("{id}")]
        public async Task<ActionResult<GridPolicy>> Get(int id)
        {
            var gridPolicy = await db.GridPolicy.FindAsync(id);
            if (gridPolicy == null)
            {
                return BadRequest();
            }
            return Ok(gridPolicy);
        }

        [HttpPost]
        public async Task<ActionResult<GridPolicy>> PostAsync([FromBody]GridPolicy gridPolicy)
        {
            if (gridPolicy == null || !ModelState.IsValid)
            {
                return BadRequest();
            }

            db.GridPolicy.Add(gridPolicy);
            await db.SaveChangesAsync();
            return Ok(gridPolicy);
        }

        [HttpPut]
        public async Task<ActionResult<GridPolicy>> PutAsync([FromBody]GridPolicy gridPolicy)
        {
            if (gridPolicy == null || !ModelState.IsValid)
            {
                return BadRequest();
            }

            db.GridPolicy.Attach(gridPolicy);
            db.Entry(gridPolicy).State = EntityState.Modified;
            await db.SaveChangesAsync();
            return Ok(gridPolicy);
        }

        [HttpDelete("{id}")]
        public async Task<ActionResult<bool>> Delete(int id)
        {
            var GridPolicy = db.GridPolicy.Find(id);
            GridPolicy.Active = false;
            await db.SaveChangesAsync();
            return Ok(true);
        }
    }
}
