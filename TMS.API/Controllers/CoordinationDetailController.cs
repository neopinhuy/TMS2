using Common.Enums;
using Common.Extensions;
using Microsoft.AspNet.OData.Query;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Nest;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using TMS.API.Extensions;
using TMS.API.Models;

namespace TMS.API.Controllers
{
    public class CoordinationDetailController : GenericController<CoordinationDetail>
    {
        public CoordinationDetailController(TMSContext context, IElasticClient client) : base(context, client)
        {
        }

        public override async Task<ActionResult<CoordinationDetail>> UpdateAsync([FromBody] CoordinationDetail entity)
        {
            UpdateChildren(entity.Surcharge);
            await base.UpdateAsync(entity);
            await db.UpdateCoorState(entity.CoordinationId);
            return Ok(entity);
        }
        [HttpGet("api/[Controller]/Getcoordinationbyid/{id}")]
        public async Task<IActionResult> Getcoordinationbyid(int id, ODataQueryOptions<CoordinationDetail> options)
        {
            var query =
                from order in db.Order
                join orderd in db.OrderDetail on order.Id equals orderd.OrderId
                join orderc in db.OrderComposition on orderd.Id equals orderc.OrderDetailId
                join coor in db.Coordination on orderc.CoordinationId equals coor.Id
                join coord in db.CoordinationDetail on coor.Id equals coord.CoordinationId
                join truck in db.Truck on coord.TruckId equals truck.Id
                join user in db.User on coord.DriverId equals user.Id
                where order.Id == id
                select new CoordinationDetail
                {
                    Id = coord.Id,
                    TruckId = coord.TruckId,
                    DriverId = coord.DriverId,
                    ContainerId = coord.ContainerId,
                    CoordinationId = coord.CoordinationId,
                    StartDate = coord.StartDate,
                    EstimatedEndDate = coord.EstimatedEndDate,
                    PackageId = coord.PackageId,
                    FreightStateId = coord.FreightStateId,
                    Note = coord.Note,
                    Active = coord.Active,
                    InsertedDate = coord.InsertedDate,
                    InsertedBy = coord.InsertedBy,
                    UpdatedDate = coord.UpdatedDate,
                    UpdatedBy = coord.UpdatedBy,
                    Truck = new Truck
                    {
                        TruckPlate = truck.TruckPlate
                    },
                    Driver = new User
                    {
                        FirstName = user.FirstName,
                        LastName = user.LastName,
                        PhoneNumber = user.PhoneNumber
                    },

                };
            return await ApplyCustomQuery(options, query);
        }
    }
}
