﻿using Microsoft.AspNetCore.Mvc;
using Nest;
using TMS.API.Models;

namespace TMS.API.Controllers
{
    [Route("api/[controller]")]
    public class QuotationTypeController : GenericController<QuotationType>
    {
        public QuotationTypeController(TMSContext context, IElasticClient client) : base(context, client)
        {

        }
    }
}
