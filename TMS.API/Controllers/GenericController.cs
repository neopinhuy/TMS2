using Common.Extensions;
using Microsoft.AspNet.OData;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
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
        protected IElasticClient _client;
        private string typeName = typeof(T).Name.ToLower();

        public GenericController(TMSContext context, IElasticClient elasticClient)
        {
            db = context;
            _client = elasticClient;
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
            await _client.Indices.CreateAsync(typeName);
            var entities = await db.Set<T>().AsQueryable().ToListAsync();
            var indexResult = await _client.IndexManyAsync(entities);
            return Ok(indexResult);
        }

        private IElasticClient InitElasticSearchClient()
        {
            var node = new Uri("http://localhost:9200");
            var settings = new ConnectionSettings(node);
            settings.DefaultIndex(typeName);
            var client = new ElasticClient(settings);
            return client;
        }

        [HttpGet("Search")]
        public virtual async Task<ActionResult<T>> Search(string query, int page = 1, int pageSize = 10)
        {
            _client = InitElasticSearchClient();
            var request = new SearchRequest
            {
                From = (page - 1) * pageSize,
                Size = pageSize,
                Query = new MultiMatchQuery { Query = query }
            };
            var matches = await _client.SearchAsync<T>(request);
            
            return Ok(matches.Documents);
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
            _client = InitElasticSearchClient();
            await _client.IndexDocumentAsync(entity);
            return entity;
        }

        [HttpPut]
        public virtual async Task<T> PutAsync([FromBody]T entity)
        {
            db.Set<T>().Attach(entity);
            db.Entry(entity).State = EntityState.Modified;
            await db.SaveChangesAsync();
            _client = InitElasticSearchClient();
            await _client.UpdateAsync(DocumentPath<T>.Id(entity), u => u.Doc(entity));
            return entity;
        }

        [HttpPost("Delete")]
        public virtual async Task<bool> Delete([FromBody]List<int> ids)
        {
            var entities = db.Set<T>().Where(x => ids.Contains((int)x.GetPropValue("Id")));
            db.Set<T>().RemoveRange(entities);
            await db.SaveChangesAsync();
            _client = InitElasticSearchClient();
            await _client.DeleteManyAsync(entities);
            return true;
        }
    }
}
