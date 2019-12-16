using Microsoft.AspNet.OData.Query;
using Microsoft.AspNetCore.Mvc;
using Nest;
using TMS.API.Models;
using System.Linq;
using System.Threading.Tasks;
using Common.Consts;

namespace TMS.API.Controllers
{
    public class LedgerController : GenericController<Ledger>
    {
        public LedgerController(TMSContext context, IElasticClient client) : base(context, client)
        {
        }

        [HttpGet("api/[Controller]/Custom")]
        public Task<IActionResult> GetLedger(ODataQueryOptions<Ledger> options)
        {
            var query =
                from le in db.Ledger
                join entity in db.Entity on le.EntityId equals entity.Id
                from vendor in db.Vendor.Where(x => x.Id == le.TargetId && entity.Name == TargetConsts.VENDOR).DefaultIfEmpty()
                from user in db.User.Where(x => x.Id == le.TargetId && entity.Name == TargetConsts.USER).DefaultIfEmpty()
                from customer in db.Customer.Where(x => x.Id == le.TargetId && entity.Name == TargetConsts.CUSTOMER).DefaultIfEmpty()
                from user2 in db.User.Where(x => x.Id == customer.Id).DefaultIfEmpty()
                select new Ledger
                {
                    Id = le.Id,
                    Active = le.Active,
                    Approved = le.Approved,
                    ApproverId = le.ApproverId,
                    Cash = le.Cash,
                    Credit = le.Credit,
                    Debit = le.Debit,
                    ExchangeRate = le.ExchangeRate,
                    OriginMoney = le.OriginMoney,
                    OriginOpeningMoney = le.OriginOpeningMoney,
                    CurrencyId = le.CurrencyId,
                    EntityId = le.EntityId,
                    HasInvoice = le.HasInvoice,
                    InsertedBy = le.InsertedBy,
                    InsertedDate = le.InsertedDate,
                    InvoiceImage = le.InvoiceImage,
                    Note = le.Note,
                    DebitAccountId = le.DebitAccountId,
                    CreditAccountId = le.CreditAccountId,
                    ReceivedAccount = le.ReceivedAccount,
                    ReceiverBankId = le.ReceiverBankId,
                    ReceiverBankBranchId = le.ReceiverBankBranchId,
                    ReceiverFullName = entity.Name == TargetConsts.USER ? user.FullName : (entity.Name == TargetConsts.VENDOR ? vendor.Name : user2.FullName),
                    TargetId = le.TargetId,
                    UpdatedBy = le.UpdatedBy,
                    UpdatedDate = le.UpdatedDate,
                };

            return ApplyCustomeQuery(options, query);
        }
    }
}
