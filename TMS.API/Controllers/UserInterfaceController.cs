using Microsoft.AspNet.OData;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using System.Linq;
using System.Net;
using System.Threading.Tasks;
using TMS.API.Models;

namespace TMS.API.Controllers
{
    [Route("api/[controller]")]
    public class UserInterfaceController : BaseController
    {
        readonly TMSContext db;

        public UserInterfaceController(TMSContext context)
        {
            db = context;
        }

        [HttpGet]
        [EnableQuery]
        public IQueryable<UserInterface> Get()
        {
            return db.UserInterface.AsQueryable();
        }

        [HttpGet("{id}")]
        public async Task<UserInterface> Get(int id)
        {
            return await db.UserInterface.FindAsync(id);
        }

        [HttpPost]
        public async Task<UserInterface> PostAsync([FromBody]UserInterface ui)
        {
            if (ui == null || !ModelState.IsValid)
            {
                HttpContext.Response.StatusCode = (int)HttpStatusCode.BadRequest;
                return null;
            }

            db.UserInterface.Add(ui);
            await db.SaveChangesAsync();
            return ui;
        }

        [HttpPut]
        public async Task<UserInterface> PutAsync([FromBody]UserInterface ui)
        {
            db.UserInterface.Attach(ui);
            db.Entry(ui).State = EntityState.Modified;
            await db.SaveChangesAsync();
            return ui;
        }

        [HttpDelete("{id}")]
        public async Task<bool> Delete(int id)
        {
            var ui = db.UserInterface.Find(id);
            ui.Active = false;
            await db.SaveChangesAsync();
            return true;
        }
    }
}
