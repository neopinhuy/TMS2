﻿using Microsoft.AspNetCore.Mvc;
using Nest;
using TMS.API.Models;

namespace TMS.API.Controllers
{
    [Route("api/[controller]")]
    public class CustomerGroupController : GenericController<CustomerGroup>
    {
        public CustomerGroupController(TMSContext context, IElasticClient client) : base(context, client)
        {
        }
    }
}
