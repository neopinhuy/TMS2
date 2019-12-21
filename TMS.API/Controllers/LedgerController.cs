using Microsoft.AspNet.OData.Query;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Nest;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using TMS.API.Models;
using TMS.UI.ViewModels;

namespace TMS.API.Controllers
{
    public class LedgerController : GenericController<Ledger>
    {
        public LedgerController(TMSContext context, IElasticClient client) : base(context, client)
        {
        }

        [HttpGet("api/[Controller]/Custom")]
        public async Task<IActionResult> GetLedger(LedgerVM filter, ODataQueryOptions<Ledger> options)
        {
            var (opening, last) = await CalcDateRange(filter);
            if (opening is null || last is null) return Ok(OdataResult<Ledger>.Empty);
            filter.FromDate = opening.InsertedDate;
            filter.ToDate = last.InsertedDate;
            var query = GetFilterQuery(filter);
            return await ApplyCustomeQuery(options, query);
        }

        [HttpGet("api/[Controller]/summary")]
        public async Task<IActionResult> GetLedgerSummary(LedgerVM filter)
        {
            var (opening, last) = await CalcDateRange(filter);
            if (opening is null || last is null) return Ok(OdataResult<Ledger>.Empty);
            filter.FromDate = opening.InsertedDate;
            filter.ToDate = last.InsertedDate;
            var query = GetFilterQuery(filter);
            var ledgers = new List<Ledger>
            {
                opening,
                new Ledger
                {
                    OpeningDebit = await query.SumAsync(x => x.Debit ?? 0) + (opening.OpeningDebit ?? 0),
                    OpeningCredit = await query.SumAsync(x => x.Credit ?? 0) + (opening.OpeningCredit ?? 0)
                }
            };
            return Ok(new OdataResult<Ledger>
            {
                value = ledgers,
            });
        }

        private async Task<(Ledger, Ledger)> CalcDateRange(LedgerVM filter)
        {
            var fromDate = (DateTime?)new DateTime(filter.FromDate.Year, filter.FromDate.Month, 1, 0, 0, 0);
            var toDate = (DateTime?)new DateTime(filter.ToDate.Year, filter.ToDate.Month, filter.ToDate.Day, 23, 59, 59, 999);
            var firstOpening = await GetFilterQuery(filter).OrderBy(x => x.InsertedDate).FirstOrDefaultAsync();
            var lastOpening = await GetFilterQuery(filter).OrderByDescending(x => x.InsertedDate).FirstOrDefaultAsync();
            if (firstOpening is null)
            {
                firstOpening = await db.Ledger.Where(le => le.InsertedDate >= filter.FromDate
                    && (filter.AccountTypeId == null || le.AccountTypeId == filter.AccountTypeId)
                    && (filter.TargetTypeId == null || le.EntityId == filter.TargetTypeId)
                    && (filter.TargetId == null || le.TargetId == filter.TargetId))
                    .OrderBy(x => x.InsertedDate).FirstOrDefaultAsync();
                fromDate = firstOpening?.InsertedDate ?? filter.FromDate;
            }

            if (lastOpening is null)
            {
                lastOpening = await db.Ledger.Where(le => le.InsertedDate <= toDate
                    && (filter.AccountTypeId == null || le.AccountTypeId == filter.AccountTypeId)
                    && (filter.TargetTypeId == null || le.EntityId == filter.TargetTypeId)
                    && (filter.TargetId == null || le.TargetId == filter.TargetId))
                    .OrderBy(x => x.InsertedDate).LastOrDefaultAsync();
                toDate = lastOpening?.InsertedDate ?? filter.ToDate;
            }
            return (firstOpening, lastOpening);
        }

        private IQueryable<Ledger> GetFilterQuery(LedgerVM filter)
        {
            return from le in db.Ledger
                   join entity in db.Entity on le.EntityId equals entity.Id
                   where
                       le.InsertedDate >= filter.FromDate && le.InsertedDate <= filter.ToDate
                       && (filter.AccountTypeId == null || le.AccountTypeId == filter.AccountTypeId)
                       && (filter.TargetTypeId == null || le.EntityId == filter.TargetTypeId)
                       && (filter.TargetId == null || le.TargetId == filter.TargetId)
                   orderby le.InsertedDate, le.Id
                   select le;
        }
    }
}
