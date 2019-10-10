using LogAPI.Models;
using Common.Interfaces;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using System.Collections.Generic;
using System.Net;
using System.Threading.Tasks;

namespace LogAPI.Controllers
{
    [Route("api/[controller]")]
    public class VendorController : BaseController, IRestful<Vendor>
    {
        readonly TMS db;

        public VendorController(TMS context)
        {
            db = context;
        }

        [HttpGet]
        public async Task<IEnumerable<Vendor>> GetList()
        {
            return await db.Vendor.ToListAsync();
        }

        [HttpGet("{id}")]
        public async Task<Vendor> Get(int id)
        {
            return await db.Vendor.FindAsync(id);
        }

        [HttpPost]
        public async Task<Vendor> PostAsync([FromBody]Vendor vendor)
        {
            if (vendor == null || !ModelState.IsValid)
            {
                HttpContext.Response.StatusCode = (int)HttpStatusCode.BadRequest;
                return null;
            }

            db.Vendor.Add(vendor);
            await db.SaveChangesAsync();
            return vendor;
        }

        [HttpPut]
        public async Task<Vendor> PutAsync([FromBody]Vendor vendor)
        {
            db.Vendor.Attach(vendor);
            db.Entry(vendor).State = EntityState.Modified;
            await db.SaveChangesAsync();
            return vendor;
        }

        [HttpDelete("{id}")]
        public async Task<bool> Delete(int id)
        {
            var Vendor = db.Vendor.Find(id);
            Vendor.Active = false;
            await db.SaveChangesAsync();
            return true;
        }
    }
}
