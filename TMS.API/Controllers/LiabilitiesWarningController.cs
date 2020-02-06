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
                               join liabiliti in db.Ledger on liabilities.LedgerId equals liabiliti.Id
                               where liabilities.ProcessStatusId == initStatus.Id
                               select new LiabilitiWarningVM
                               {
                                   Id = liabilities.Id,
                                   DueDate = liabilities.DueDate,
                                   ReceiverFullName = liabiliti.ReceiverFullName,
                                   AccountType = liabiliti.AccountType.Description,
                               };
            var dtcountLia = dataCountLia.CountAsync();
            var listdataCountLia = dataCountLia.Take(5).ToListAsync();
            var dataCountTruck = from trucks in db.TruckMaintenanceWarning
                                 join truck in db.Truck on trucks.TruckId equals truck.Id
                                 where trucks.ProcessStatusId == initStatus.Id
                                 select new TruckWarningVM
                                 {
                                     Id = truck.Id,
                                     NextMaintenanceDate = trucks.NextMaintenanceDate,
                                     FirstName = truck.Driver.FirstName,
                                     LastName = truck.Driver.LastName,
                                     TruckPlate = truck.TruckPlate,
                                     Color = truck.Color
                                 };
            var dtCountTruck = dataCountTruck.CountAsync();
            var listdtCountTruck = dataCountTruck.Take(5).ToListAsync();
            var dataCountCus = from cus in db.CustomerCareWarning
                               join cu in db.CustomerCare on cus.CustomerCareId equals cu.Id
                               where cus.ProcessStatusId == initStatus.Id
                               select new CustomerCareWarningVM
                               {
                                   Id = cus.Id,
                                   LastContactDate = cus.LastContactDate,
                                   GroupName = cu.Customer.CustomerGroup.Name,
                                   LastName = cu.Customer.User.LastName,
                                   FirstName = cu.Customer.User.FirstName,
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