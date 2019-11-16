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
        public virtual async Task<ActionResult<T>> PostAsync([FromBody]T entity)
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
        public virtual async Task<ActionResult<T>> PutAsync([FromBody]T entity)
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
    }
}
