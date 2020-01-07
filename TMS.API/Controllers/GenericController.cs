using Common.Extensions;
using Microsoft.AspNet.OData.Query;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Query.Internal;
using Nest;
using System;
using System.Collections;
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
                AllowedQueryOptions = AllowedQueryOptions.All,
                MaxExpansionDepth = 3
            });

            var results = options.ApplyTo(query);
            return Ok(results);
        }

        public async Task<IActionResult> ApplyCustomQuery(ODataQueryOptions<T> options, IQueryable<T> query)
        {
            options.Validate(new ODataValidationSettings()
            {
                AllowedQueryOptions = AllowedQueryOptions.All,
                MaxExpansionDepth = 3
            });

            var appliedQuery = (EntityQueryable<T>)options.ApplyTo(query);
            var result = await appliedQuery.ToListAsync();
            return Ok(new OdataResult<T>
            {
                value = result,
                odata = new Odata
                {
                    count = options.Count?.Value == true ? query.Count() : 0,
                    Context = options.Context.ToString()
                }
            });
        }

        [HttpPost("api/[Controller]")]
        public virtual async Task<ActionResult<T>> CreateAsync([FromBody]T entity)
        {
            if (entity == null || !ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }
            entity.SetPropValue(nameof(Component.InsertedBy), 1); // hard code for now
            entity.SetPropValue(nameof(Component.InsertedDate), DateTime.Now); // hard code for now
            entity.SetPropValue(nameof(Component.Active), true); // hard code for now
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

        [HttpPut("api/[Controller]/BulkUpdate")]
        public async Task<ActionResult<bool>> BulkUpdateAsync([FromBody]List<T> entities)
        {
            entities.ForEach(x =>
            {
                db.Set<T>().Attach(x);
                db.Entry(x).State = EntityState.Modified;
            });
            await db.SaveChangesAsync();
            return Ok(true);
        }

        [HttpPost("api/[Controller]/Delete")]
        public virtual async Task<ActionResult<bool>> Delete([FromBody]List<int> ids)
        {
            var entities = db.Set<T>().Where(x => ids.Contains((int)x.GetPropValue("Id")));
            await entities.ForEachAsync(x => x.SetPropValue("Active", false));
            await db.SaveChangesAsync();
            return true;
        }

        protected void UpdateChildren<Child>(IEnumerable<Child> entities, Action<Child> add = null, Action<Child> update = null) where Child : class
        {
            if (entities.Nothing()) return;
            foreach (var detail in entities)
            {
                var id = (int)detail.GetPropValue("Id");
                if (id == 0)
                {
                    db.Set<Child>().Add(detail);
                    add?.Invoke(detail);
                }
                else if (id > 0)
                {
                    db.Set<Child>().Attach(detail);
                    db.Entry(detail).State = EntityState.Modified;
                    db.Set<Child>().Update(detail);
                    update?.Invoke(detail);
                }
            }
        }
    }
}
