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
    public class TruckController : GenericController<Truck>
    {
        public TruckController(TMSContext context, IElasticClient client) : base(context, client)
        {

        }
        [HttpGet("api/[Controller]/ImportTruckWarning")]
        public async Task<IActionResult> ImportTruckWarning()
        {
            var setting = await db.MasterData.FirstOrDefaultAsync(m => m.Name == "MaintenanceSettings");
            var initStatus = await db.MasterData.FirstOrDefaultAsync(m => m.Name == "UnreadStatus"
                                                                       && m.Parent.Name == "LiabilitiesWarningStatus");
            var parsed = int.TryParse(setting.Description, out int res);
            DateTime today = new DateTime(DateTime.Now.Year, DateTime.Now.Month, DateTime.Now.Day, 00, 00, 00, 000);
            DateTime commingtoday = new DateTime(DateTime.Now.Year, DateTime.Now.Month, DateTime.Now.Day, 23, 59, 59, 999);
            var commingDate = today.AddDays(parsed ? res : 3);
            var dataWarning =
                from truck in db.Truck
                from t in db.TruckMaintenanceWarning.Where(x => x.TruckId == truck.Id).DefaultIfEmpty()
                where truck.NextMaintenanceDate <= commingDate && truck.NextMaintenanceDate >= today
                                                    && t == null
                select truck;
            var list = await dataWarning.ToListAsync();
            var warning = list.Select(x => new TruckMaintenanceWarning
            {

                TruckId = x.Id,
                NextMaintenanceDate = x.NextMaintenanceDate,
                Note = x.Note,
                ProcessStatusId = initStatus.Id
            });
            db.TruckMaintenanceWarning.AddRange(warning);
            await db.SaveChangesAsync();
            return Ok(true);
        }
    }
}
