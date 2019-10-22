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
    public class UserController : BaseController
    {
        readonly TMSContext db;

        public UserController(TMSContext context)
        {
            db = context;
        }

        [HttpGet]
        [EnableQuery]
        public IQueryable<User> Get()
        {
            return db.User.AsQueryable();
        }

        [HttpGet("{id}")]
        public async Task<User> Get(int id)
        {
            return await db.User.FindAsync(id);
        }

        [HttpPost]
        public async Task<User> PostAsync([FromBody]User user)
        {
            if (user == null || !ModelState.IsValid)
            {
                HttpContext.Response.StatusCode = (int)HttpStatusCode.BadRequest;
                return null;
            }

            db.User.Add(user);
            await db.SaveChangesAsync();
            return user;
        }

        [HttpPut]
        public async Task<User> PutAsync([FromBody]User user)
        {
            db.User.Attach(user);
            db.Entry(user).State = EntityState.Modified;
            await db.SaveChangesAsync();
            return user;
        }

        [HttpDelete("{id}")]
        public async Task<bool> Delete(int id)
        {
            var user = db.User.Find(id);
            user.Active = false;
            await db.SaveChangesAsync();
            return true;
        }
    }
}
