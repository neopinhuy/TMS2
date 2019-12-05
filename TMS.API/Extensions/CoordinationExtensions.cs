using Microsoft.EntityFrameworkCore;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using TMS.API.Models;

namespace TMS.API.Extensions
{
    public static class CoordinationExtensions
    {
        public static async Task UpdateCoorState(this TMSContext db, int? coorId)
        {
            var coorDetails = db.CoordinationDetail.Where(x => x.CoordinationId == coorId);
            var states = coorDetails.Select(x => x.FreightStateId).ToList();
            if (states.Distinct().Count() == 1)
            {
                var coor = await db.Coordination.FindAsync(coorId);
                coor.FreightStateId = states.First();
            }
        }
    }
}
