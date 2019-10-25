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
    public class DepartmentController : BaseController
    {
        readonly TMSContext db;

        public DepartmentController(TMSContext context)
        {
            db = context;
        }

        [HttpGet]
        [EnableQuery]
        public IQueryable<Department> Get()
        {
            return db.Department.AsQueryable();
        }

        [HttpGet("{id}")]
        public async Task<Department> Get(int id)
        {
            return await db.Department.FindAsync(id);
        }

        [HttpPost]
        public async Task<Department> PostAsync([FromBody]Department department)
        {
            if (department == null || !ModelState.IsValid)
            {
                HttpContext.Response.StatusCode = (int)HttpStatusCode.BadRequest;
                return null;
            }

            db.Department.Add(department);
            await db.SaveChangesAsync();
            return department;
        }

        [HttpPut]
        public async Task<Department> PutAsync([FromBody]Department department)
        {
            db.Department.Attach(department);
            db.Entry(department).State = EntityState.Modified;
            await db.SaveChangesAsync();
            return department;
        }

        [HttpDelete("{id}")]
        public async Task<bool> Delete(int id)
        {
            var department = db.Department.Find(id);
            department.Active = false;
            await db.SaveChangesAsync();
            return true;
        }
    }
}
