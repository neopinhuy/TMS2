using Common.Extensions;
using Microsoft.AspNet.OData;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Logging.Abstractions;
using Nest;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using TMS.API.Attributes;
using TMS.API.Models;

namespace TMS.API.Controllers
{
    [ApiController]
    [ValidateModel]
    public class GenericController<T> : ControllerBase where T : class
    {
        protected readonly TMSContext db;
        protected IElasticClient _elasticClient;

        public GenericController(TMSContext context, IElasticClient elasticClient)
        {
            db = context;
            _elasticClient = elasticClient;
        }

        [HttpGet]
        [EnableQuery]
        public virtual IQueryable<T> Get()
        {
            return db.Set<T>().AsQueryable();
        }

        [HttpGet("BuildIndex")]
        public virtual async Task<ActionResult<T>> BuildIndex()
        {
            var entities = await db.Set<T>().AsQueryable().ToListAsync();
            _elasticClient = InitElasticSearchClient();
            var res = await _elasticClient.IndexManyAsync(entities);
            return Ok(res);
        }

        private ElasticClient InitElasticSearchClient()
        {
            var node = new Uri("http://localhost:9200");
            var settings = new ConnectionSettings(node);
            settings.DefaultIndex(typeof(T).Name);
            var client = new ElasticClient(settings);
            return client;
        }

        [HttpGet("Search")]
        public virtual async Task<ActionResult<T>> Search(string query, int page = 1, int pageSize = 10)
        {
            _elasticClient = InitElasticSearchClient();
            var entities = await _elasticClient.SearchAsync<T>(s => s
                .Query(q => q                           // define query
                    .MultiMatch(mp => mp                // of type MultiMatch
                        .Query(query)))
                .From((page - 1) * pageSize)
                .Size(pageSize));
            return Ok(entities.Documents);
        }

        [HttpPost]
        public virtual async Task<ActionResult<T>> PostAsync([FromBody]T entity)
        {
            if (entity == null || !ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }
            db.Set<T>().Add(entity);
            await db.SaveChangesAsync();
            await _elasticClient.IndexDocumentAsync(entity);
            return entity;
        }

        [HttpPut]
        public virtual async Task<T> PutAsync([FromBody]T entity)
        {
            db.Set<T>().Attach(entity);
            db.Entry(entity).State = EntityState.Modified;
            await db.SaveChangesAsync();
            await _elasticClient.UpdateAsync<T>(entity, u => u.Doc(entity));
            return entity;
        }

        [HttpPost("Delete")]
        public virtual async Task<bool> Delete([FromBody]List<int> ids)
        {
            var entities = db.Set<T>().Where(x => ids.Contains((int)x.GetPropValue("Id")));
            db.Set<T>().RemoveRange(entities);
            await db.SaveChangesAsync();
            await _elasticClient.DeleteManyAsync(entities);
            return true;
        }
    }
}
