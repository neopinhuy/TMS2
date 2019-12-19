using Microsoft.AspNet.OData.Query;
using Microsoft.AspNetCore.Mvc;
using Nest;
using TMS.API.Models;
using System.Linq;
using System.Threading.Tasks;
using Common.Consts;
using System;
using Microsoft.EntityFrameworkCore;
using TMS.UI.ViewModels;
using System.Collections.Generic;

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
            var query =
                from le in db.Ledger
                join entity in db.Entity on le.EntityId equals entity.Id
                from vendor in db.Vendor.Where(x => x.Id == le.TargetId && entity.Name == TargetConsts.VENDOR).DefaultIfEmpty()
                from user in db.User.Where(x => x.Id == le.TargetId && entity.Name == TargetConsts.USER).DefaultIfEmpty()
                from customer in db.Customer.Where(x => x.Id == le.TargetId && entity.Name == TargetConsts.CUSTOMER).DefaultIfEmpty()
                from user2 in db.User.Where(x => x.Id == customer.Id).DefaultIfEmpty()
                where le.InsertedDate >= opening.InsertedDate && le.InsertedDate <= last.InsertedDate
                    && (filter.AccountTypeId == null || le.AccountTypeId == filter.AccountTypeId)
                    && (filter.TargetId == null || le.TargetId == filter.TargetId && le.EntityId == filter.TargetTypeId)
                orderby le.InsertedDate
                select new Ledger
                {
                    Id = le.Id,
                    Active = le.Active,
                    OpeningCredit = le.OpeningCredit,
                    OpeningDebit = le.OpeningDebit,
                    OriginOpeningCredit = le.OriginOpeningCredit,
                    OriginOpeningDebit = le.OriginOpeningDebit,
                    Approved = le.Approved,
                    ApproverId = le.ApproverId,
                    Cash = le.Cash,
                    Credit = le.Credit,
                    Debit = le.Debit,
                    OriginCredit = le.OriginCredit,
                    OriginDebit = le.OriginDebit,
                    ExchangeRate = le.ExchangeRate,
                    CurrencyId = le.CurrencyId,
                    EntityId = le.EntityId,
                    HasInvoice = le.HasInvoice,
                    InsertedBy = le.InsertedBy,
                    InsertedDate = le.InsertedDate,
                    InvoiceImage = le.InvoiceImage,
                    Note = le.Note,
                    AccountTypeId = le.AccountTypeId,
                    CreditAccountId = le.CreditAccountId,
                    ReceivedAccount = le.ReceivedAccount,
                    ReceiverBankId = le.ReceiverBankId,
                    ReceiverBankBranchId = le.ReceiverBankBranchId,
                    ReceiverFullName = entity.Name == TargetConsts.USER ? user.FullName : (entity.Name == TargetConsts.VENDOR ? vendor.Name : user2.FullName),
                    TargetId = le.TargetId,
                    UpdatedBy = le.UpdatedBy,
                    UpdatedDate = le.UpdatedDate,
                };

            return await ApplyCustomeQuery(options, query);
        }

        [HttpGet("api/[Controller]/summary")]
        public async Task<IActionResult> GetLedgerSummary(LedgerVM filter)
        {
            var (opening, last) = await CalcDateRange(filter);
            var query =
               from le in db.Ledger
               where le.InsertedDate >= opening.InsertedDate && le.InsertedDate <= last.InsertedDate
                    && (filter.AccountTypeId == null || le.AccountTypeId == filter.AccountTypeId)
                    && (filter.TargetId == null || le.TargetId == filter.TargetId && le.EntityId == filter.TargetTypeId)
               select le;
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
            var firstOpening = await GetOpeningRange(filter).OrderBy(x => x.InsertedDate).FirstOrDefaultAsync();
            var lastOpening = await GetOpeningRange(filter).OrderByDescending(x => x.InsertedDate).FirstOrDefaultAsync();
            if (firstOpening is null)
            {
                firstOpening = await db.Ledger.Where(le => le.InsertedDate >= filter.FromDate
                    && (filter.AccountTypeId == null || le.AccountTypeId == filter.AccountTypeId)
                    && (filter.TargetId == null || le.TargetId == filter.TargetId && le.EntityId == filter.TargetTypeId))
                    .OrderBy(x => x.InsertedDate).FirstOrDefaultAsync();
                fromDate = firstOpening?.InsertedDate ?? filter.FromDate;
            }

            if (lastOpening is null)
            {
                lastOpening = await db.Ledger.Where(le => le.InsertedDate <= toDate
                    && (filter.AccountTypeId == null || le.AccountTypeId == filter.AccountTypeId)
                    && (filter.TargetId == null || le.TargetId == filter.TargetId && le.EntityId == filter.TargetTypeId))
                    .OrderBy(x => x.InsertedDate).LastOrDefaultAsync();
                toDate = lastOpening?.InsertedDate ?? filter.ToDate;
            }
            return (firstOpening, lastOpening);
        }

        private IQueryable<Ledger> GetOpeningRange(LedgerVM filter)
        {
            return db.Ledger
                .Where(le => le.InsertedDate >= filter.FromDate && le.InsertedDate <= filter.ToDate 
                    && (le.OpeningCredit != null || le.OpeningDebit != null)
                    && (filter.AccountTypeId == null || le.AccountTypeId == filter.AccountTypeId)
                    && (filter.TargetId == null || le.TargetId == filter.TargetId && le.EntityId == filter.TargetTypeId));
        }
    }
}
