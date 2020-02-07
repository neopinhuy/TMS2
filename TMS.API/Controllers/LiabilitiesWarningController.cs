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
    public class LiabilitiesWarningController : GenericController<LiabilitiesWarning>
    {
        public LiabilitiesWarningController(TMSContext context, IElasticClient client) : base(context, client)
        {

        }
        [HttpGet("api/[Controller]/Notifications")]
        public async Task<ActionResult> Notifications()
        {
            WarningAndNotificationsVM notifications = new WarningAndNotificationsVM();

            var initStatus = await db.MasterData.FirstOrDefaultAsync(m => m.Name == "UnreadStatus"
                                                                       && m.Parent.Name == "LiabilitiesWarningStatus");
            var dataCountLia = from liabilities in db.LiabilitiesWarning
                               join ledger in db.Ledger on liabilities.LedgerId equals ledger.Id
                               join accountType in db.MasterData on ledger.AccountTypeId equals accountType.Id
                               from bank in db.Bank.Where(x => ledger.ReceiverBankId == x.Id).DefaultIfEmpty()
                               where liabilities.ProcessStatusId == initStatus.Id
                               select new LiabilitiesWarning
                               {
                                   Id = liabilities.Id,
                                   DueDate = liabilities.DueDate,
                                   ProcessStatusId=liabilities.ProcessStatusId,
                                   Note=liabilities.Note,
                                   Active=liabilities.Active,
                                   InsertedDate=liabilities.InsertedDate,
                                   InsertedBy=liabilities.InsertedBy,
                                   UpdatedBy=liabilities.UpdatedBy,
                                   UpdatedDate=liabilities.UpdatedDate,
                                   LedgerId =liabilities.LedgerId,
                                   Ledger = new Ledger
                                   {
                                       ReceiverFullName = ledger.ReceiverFullName ?? "",
                                       AccountType = new MasterData
                                       {
                                           Description = accountType.Description ?? ""
                                       },
                                       ReceiverBank = new Bank
                                       {
                                           Name = bank.Name ?? ""
                                       }
                                   }
                               };
            var dtcountLia = dataCountLia.CountAsync();
            var listdataCountLia = dataCountLia.Take(5).ToListAsync();
            var dataCountTruck = from trucks in db.TruckMaintenanceWarning
                                 join truck in db.Truck on trucks.TruckId equals truck.Id
                                 from driver in db.User.Where(x=>truck.DriverId == x.Id).DefaultIfEmpty()

                                 where trucks.ProcessStatusId == initStatus.Id
                                 select new TruckMaintenanceWarning
                                 {
                                     Id= trucks.Id,
                                     NextMaintenanceDate = truck.NextMaintenanceDate,
                                     Note = trucks.Note,
                                     Active = trucks.Active,
                                     InsertedDate = trucks.InsertedDate,
                                     InsertedBy = trucks.InsertedBy,
                                     UpdatedBy = trucks.UpdatedBy,
                                     UpdatedDate = trucks.UpdatedDate,
                                     TruckId= trucks.TruckId,
                                     ProcessStatusId = trucks.ProcessStatusId,
                                     Truck = new Truck
                                     {
                                         TruckPlate = truck.TruckPlate ?? "",
                                         Color = truck.Color ?? "",
                                         Driver = new User
                                         {
                                             FirstName = driver.FirstName ?? "",
                                             LastName = driver.LastName ?? ""
                                         }

                                     }

                                 };
            var dtCountTruck = dataCountTruck.CountAsync();
            var listdtCountTruck = dataCountTruck.Take(5).ToListAsync();
            var dataCountCus = from cus in db.CustomerCareWarning
                               join cu in db.CustomerCare on cus.CustomerCareId equals cu.Id
                               join customer in db.Customer on cu.CustomerId equals customer.Id
                               join user in db.User on customer.UserId equals user.Id
                               join groupname in db.MasterData on customer.CustomerGroupId equals groupname.Id
                               where cus.ProcessStatusId == initStatus.Id
                               select new CustomerCareWarning
                               {
                                   Id = cus.Id,
                                   LastContactDate = cus.LastContactDate,
                                   ProcessStatusId = cus.ProcessStatusId,
                                   Note = cus.Note,
                                   Active = cus.Active,
                                   InsertedDate = cus.InsertedDate,
                                   InsertedBy = cus.InsertedBy,
                                   UpdatedBy = cus.UpdatedBy,
                                   UpdatedDate = cus.UpdatedDate,
                                   CustomerCareId= cus.CustomerCareId,
                                   CustomerCare = new CustomerCare
                                   {
                                       Customer = new Customer
                                       {
                                           User = new User
                                           {
                                               FirstName = user.FirstName ?? "",
                                               LastName = user.LastName ?? "",
                                               Avatar = user.Avatar ?? ""
                                           },
                                           CustomerGroup = new MasterData
                                           {
                                               Name = groupname.Name ?? ""
                                           }
                                       }
                                   }
                               };
            var dtCountCus = dataCountCus.CountAsync();
            var listdtCountCus = dataCountCus.Take(5).ToListAsync();
            await Task.WhenAll(dtcountLia, dtCountTruck, dtCountCus, listdtCountTruck, listdtCountCus, listdataCountLia);

            notifications.CountLWarningsLiabilities = dtcountLia.Result;
            notifications.CountLWarningsCustomerCare = dtCountCus.Result;
            notifications.CountLWarningsTruck = dtCountTruck.Result;
            notifications.LWarningsTruck = listdtCountTruck.Result;
            notifications.LWarningsLiabilities = listdataCountLia.Result;
            notifications.LWarningsCustomerCare = listdtCountCus.Result;

            return Ok(notifications);
        }
    }
}