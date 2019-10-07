﻿using LogAPI.Models;
using LogContract.Interfaces;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using System.Collections.Generic;
using System.Net;
using System.Threading.Tasks;

namespace LogAPI.Controllers
{
    [Route("api/[controller]")]
    public class UserController : BaseController, IRestful<User>
    {
        readonly TMS db = new TMS();

        [HttpGet]
        public async Task<IEnumerable<User>> GetList()
        {
            return await db.User.ToListAsync();
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
