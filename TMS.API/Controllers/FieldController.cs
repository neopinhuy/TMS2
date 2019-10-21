using TMS.API.Attributes;
using TMS.API.Models;
using Common.Clients;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using System.Collections.Generic;
using System.Net;
using System.Threading.Tasks;

namespace TMS.API.Controllers
{
    [Route("api/[controller]")]
    public class FieldController : BaseController, IRestful<Field>
    {
        readonly TMSContext db;

        public FieldController(TMSContext context)
        {
            db = context;
        }

        [HttpGet]
        public async Task<IEnumerable<Field>> GetList()
        {
            return await db.Field.ToListAsync();
        }

        [HttpGet("{id}")]
        public async Task<Field> Get(int id)
        {
            var entity = await db.Field.FindAsync(id);
            if (entity == null)
            {
                HttpContext.Response.StatusCode = (int)HttpStatusCode.BadRequest;
                return null;
            }
            HttpContext.Response.StatusCode = (int)HttpStatusCode.BadRequest;
            return entity;
        }

        [HttpPost]
        [ValidateModel]
        public async Task<Field> PostAsync([FromBody]Field field)
        {
            if (field == null || !ModelState.IsValid)
            {
                HttpContext.Response.StatusCode = (int)HttpStatusCode.BadRequest;
                return null;
            }

            db.Field.Add(field);
            await db.SaveChangesAsync();
            return field;
        }

        [HttpPut]
        [ValidateModel]
        public async Task<Field> PutAsync([FromBody]Field field)
        {
            if (field == null || !ModelState.IsValid)
            {
                HttpContext.Response.StatusCode = (int)HttpStatusCode.BadRequest;
                return null;
            }

            db.Field.Attach(field);
            db.Entry(field).State = EntityState.Modified;
            await db.SaveChangesAsync();
            return field;
        }

        [HttpDelete("{id}")]
        public async Task<bool> Delete(int id)
        {
            var Field = db.Field.Find(id);
            Field.Active = false;
            await db.SaveChangesAsync();
            return true;
        }
    }
}
