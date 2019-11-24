using Common.Extensions;
using Microsoft.AspNet.OData.Query;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Nest;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using TMS.API.Models;

namespace TMS.API.Controllers
{
    public class GenericController<T> : ControllerBase where T : class
    {
        protected readonly TMSContext db;
        protected IElasticClient _client;

        public GenericController(TMSContext context, IElasticClient elasticClient)
        {
            db = context;
            _client = elasticClient;
        }

        [HttpGet("api/[Controller]/{id}")]
        public virtual async Task<IActionResult> Get(int id)
        {
            var res = await db.Set<T>().FindAsync(id);
            return Ok(res);
        }

        [HttpGet]
        public virtual IActionResult Get(ODataQueryOptions<T> options)
        {
            var query = db.Set<T>().AsQueryable();
            return ApplyQuery(options, query);
        }

        protected IActionResult ApplyQuery(ODataQueryOptions<T> options, IQueryable<T> query)
        {
            options.Validate(new ODataValidationSettings()
            {
                AllowedQueryOptions = AllowedQueryOptions.All
            });

            var results = options.ApplyTo(query);
            return Ok(results);
        }

        [HttpPost("api/[Controller]")]
        public virtual async Task<ActionResult<T>> CreateAsync([FromBody]T entity)
        {
            if (entity == null || !ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }
            db.Set<T>().Add(entity);
            await db.SaveChangesAsync();
            return entity;
        }

        [HttpPut("api/[Controller]")]
        public virtual async Task<ActionResult<T>> UpdateAsync([FromBody]T entity)
        {
            if (entity == null || !ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            db.Set<T>().Attach(entity);
            db.Entry(entity).State = EntityState.Modified;
            await db.SaveChangesAsync();
            return entity;
        }

        [HttpPost("api/[Controller]/Delete")]
        public virtual async Task<bool> Delete([FromBody]List<int> ids)
        {
            var entities = db.Set<T>().Where(x => ids.Contains((int)x.GetPropValue("Id")));
            db.Set<T>().RemoveRange(entities);
            await db.SaveChangesAsync();
            return true;
        }

        protected void UpdateChildren<Child>(T entity) where Child : class
        {
            var childProp = typeof(T).GetProperty(typeof(Child).Name);
            var childValue = childProp.GetValue(entity) as ICollection<Child>;
            foreach (var detail in childValue)
            {
                var id = (int)detail.GetPropValue("Id");
                if (id == 0)
                {
                    detail.SetPropValue("Id", 0);
                    db.Set<Child>().Add(detail);
                }
                else if (id > 0)
                {
                    db.Set<Child>().Attach(detail);
                    db.Entry(detail).State = EntityState.Modified;
                    db.Set<Child>().Update(detail);
                }
            }
        }
    }
}
