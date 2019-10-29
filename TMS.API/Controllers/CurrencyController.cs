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
    public class CurrencyController : BaseController
    {
        readonly TMSContext db;

        public CurrencyController(TMSContext context)
        {
            db = context;
        }

        [HttpGet]
        [EnableQuery]
        public IQueryable<Currency> Get()
        {
            return db.Currency.AsQueryable();
        }

        [HttpGet("{id}")]
        public async Task<Currency> Get(int id)
        {
            var entity = await db.Currency.FindAsync(id);
            if (entity == null)
            {
                HttpContext.Response.StatusCode = (int)HttpStatusCode.BadRequest;
                return null;
            }
            HttpContext.Response.StatusCode = (int)HttpStatusCode.BadRequest;
            return entity;
        }

        [HttpPost]
        public async Task<Currency> PostAsync([FromBody]Currency currency)
        {
            if (currency == null || !ModelState.IsValid)
            {
                HttpContext.Response.StatusCode = (int)HttpStatusCode.BadRequest;
                return null;
            }

            db.Currency.Add(currency);
            await db.SaveChangesAsync();
            return currency;
        }

        [HttpPut]
        public async Task<Currency> PutAsync([FromBody]Currency currency)
        {
            if (currency == null || !ModelState.IsValid)
            {
                HttpContext.Response.StatusCode = (int)HttpStatusCode.BadRequest;
                return null;
            }

            db.Currency.Attach(currency);
            db.Entry(currency).State = EntityState.Modified;
            await db.SaveChangesAsync();
            return currency;
        }

        [HttpDelete("{id}")]
        public async Task<bool> Delete(int id)
        {
            var Currency = db.Currency.Find(id);
            Currency.Active = false;
            await db.SaveChangesAsync();
            return true;
        }
    }
}
