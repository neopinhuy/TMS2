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

namespace TMS.API.Controllers
{
    public class LedgerController : GenericController<Ledger>
    {
        public LedgerController(TMSContext context, IElasticClient client) : base(context, client)
        {
        }

        [HttpGet("api/[Controller]/{fromMonth}/{toMonth}")]
        public async Task<IActionResult> GetLedger(DateTime fromMonth, DateTime toMonth, ODataQueryOptions<Ledger> options)
        {
            var fromDate = new DateTime(fromMonth.Year, fromMonth.Month, 1, 0, 0, 0);
            var toDate = new DateTime(toMonth.Year, toMonth.Month, toMonth.Day, 23, 59, 59, 999);
            var firstOpening = await GetLedgerRange(fromDate, toDate).FirstOrDefaultAsync();
            var lastOpening = await GetLedgerRange(fromDate, toDate).LastOrDefaultAsync();
            if (firstOpening is null)
            {
                firstOpening = await db.Ledger.Where(x => x.InsertedDate >= fromMonth)
                    .OrderBy(x => x.InsertedDate).FirstOrDefaultAsync();
                if (firstOpening is null) return NoContent();
                fromDate = firstOpening.InsertedDate;
            }

            if (lastOpening is null)
            {
                lastOpening = await db.Ledger.Where(x => x.InsertedDate <= toDate)
                    .OrderBy(x => x.InsertedDate).LastOrDefaultAsync();
                if (lastOpening is null) return NoContent();
                toDate = lastOpening.InsertedDate;
            }

            var query =
                from le in db.Ledger
                join entity in db.Entity on le.EntityId equals entity.Id
                from vendor in db.Vendor.Where(x => x.Id == le.TargetId && entity.Name == TargetConsts.VENDOR).DefaultIfEmpty()
                from user in db.User.Where(x => x.Id == le.TargetId && entity.Name == TargetConsts.USER).DefaultIfEmpty()
                from customer in db.Customer.Where(x => x.Id == le.TargetId && entity.Name == TargetConsts.CUSTOMER).DefaultIfEmpty()
                from user2 in db.User.Where(x => x.Id == customer.Id).DefaultIfEmpty()
                where le.InsertedDate >= fromDate && le.InsertedDate <= toDate
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
            var fromDate = new DateTime(filter.FromDate.Year, filter.FromDate.Month, 1, 0, 0, 0);
            var toDate = new DateTime(filter.ToDate.Year, filter.ToDate.Month, filter.ToDate.Day, 23, 59, 59, 999);
            var firstOpening = await GetLedgerRange(fromDate, toDate).FirstOrDefaultAsync();
            var lastOpening = await GetLedgerRange(fromDate, toDate).LastOrDefaultAsync();
            if (firstOpening is null)
            {
                firstOpening = await db.Ledger.Where(x => x.InsertedDate >= filter.FromDate)
                    .OrderBy(x => x.InsertedDate).FirstOrDefaultAsync();
                if (firstOpening is null) return NoContent();
                fromDate = firstOpening.InsertedDate;
            }

            if (lastOpening is null)
            {
                lastOpening = await db.Ledger.Where(x => x.InsertedDate <= toDate)
                    .OrderBy(x => x.InsertedDate).LastOrDefaultAsync();
                if (lastOpening is null) return NoContent();
                toDate = lastOpening.InsertedDate;
            }

            return Ok();
        }

        private IQueryable<Ledger> GetLedgerRange(DateTime fromMonth, DateTime toMonth)
        {
            return db.Ledger
                .Where(x => x.InsertedDate <= toMonth && x.InsertedDate >= fromMonth
                    && (x.OriginDebit != null || x.OriginCredit != null))
                .OrderBy(x => x.InsertedDate);
        }

        public Task<Ledger> FindFirstOpening(DateTime? fromMonth)
        {
            return db.Ledger
                .Where(x => fromMonth == null || x.InsertedDate >= fromMonth)
                .OrderByDescending(x => x.InsertedDate)
                .FirstOrDefaultAsync(x => x.OriginDebit != null || x.OriginCredit != null);
        }
    }
}
