﻿using Microsoft.AspNetCore.Mvc;
using Nest;
using TMS.API.Models;

namespace TMS.API.Controllers
{
    [Route("api/[controller]")]
    public class WeightRangeController : GenericController<WeightRange>
    {
        public WeightRangeController(TMSContext context, IElasticClient client) : base(context, client)
        {
        }
    }
}
