﻿using Microsoft.AspNetCore.Mvc;
using Nest;
using TMS.API.Models;

namespace TMS.API.Controllers
{
    
    public class DistanceRangeController : GenericController<DistanceRange>
    {
        public DistanceRangeController(TMSContext context, IElasticClient client) : base(context, client)
        {
        }
    }
}
