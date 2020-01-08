using Common.ViewModels;
using Microsoft.AspNet.OData.Query;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Nest;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using TMS.API.Models;

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
            var appliedQuery = (IQueryable<Ledger>)options.ApplyTo(query);
            var result = await appliedQuery.ToListAsync();
            foreach (var ledger in result)
            {
                if (ledger.AccountType != null)
                {
                    ledger.AccountType = new MasterData
                    {
                        Id = ledger.AccountType.Id,
                        Name = ledger.AccountType.Name,
                        Description = ledger.AccountType.Description
                    };
                }
                if (ledger.Entity != null)
                {
                    ledger.Entity = new Entity
                    {
                        Id = ledger.Entity.Id,
                        Name = ledger.Entity.Name
                    };
                }
                if (ledger.Approver != null)
                {
                    ledger.Approver = new User
                    {
                        Id = ledger.Approver.Id,
                        FirstName = ledger.Approver.FirstName,
                        LastName = ledger.Approver.LastName
                    };
                }
                if (ledger.Currency != null)
                {
                    ledger.Currency = new MasterData
                    {
                        Id = ledger.Currency.Id,
                        Name = ledger.Currency.Name,
                        Description = ledger.Currency.Description
                    };
                }
                if (ledger.ReceiverBank != null)
                {
                    ledger.ReceiverBank = new Bank
                    {
                        Id = ledger.ReceiverBank.Id,
                        Name = ledger.ReceiverBank.Name,
                        FullName = ledger.ReceiverBank.FullName
                    };
                }
                if (ledger.ReceiverBankBranch != null)
                {
                    ledger.ReceiverBankBranch = new BankBranch
                    {
                        Id = ledger.ReceiverBankBranch.Id,
                        Name = ledger.ReceiverBankBranch.Name
                    };
                }
                if (ledger.InsertedByNavigation != null)
                ledger.InsertedByNavigation = new User
                {
                    Id = ledger.InsertedByNavigation.Id,
                    FirstName = ledger.InsertedByNavigation.FirstName,
                    LastName = ledger.InsertedByNavigation.LastName
                };
                if (ledger.UpdatedByNavigation != null)
                ledger.UpdatedByNavigation = new User
                {
                    Id = ledger.UpdatedByNavigation.Id,
                    FirstName = ledger.UpdatedByNavigation.FirstName,
                    LastName = ledger.UpdatedByNavigation.LastName
                };
            }
            return Ok(new OdataResult<Ledger>
            {
                value = result,
                odata = new Odata
                {
                    count = options.Count?.Value == true ? query.Count() : 0,
                    Context = options.Context.ToString()
                }
            });
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
            return from le in db.Ledger.Include(x => x.AccountType).Include(x => x.Entity)
                                       .Include(x => x.Approver).Include(x => x.Currency)
                                       .Include(x => x.ReceiverBank).Include(x => x.ReceiverBankBranch)
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
