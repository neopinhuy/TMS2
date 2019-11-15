﻿using Microsoft.AspNetCore.Mvc;
using Nest;
using TMS.API.Models;

namespace TMS.API.Controllers
{
    
    public class LedgerController : GenericController<Ledger>
    {
        public LedgerController(TMSContext context, IElasticClient client) : base(context, client)
        {
        }
    }
}
