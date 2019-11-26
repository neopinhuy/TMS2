using Microsoft.EntityFrameworkCore;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using TMS.API.Models;

namespace TMS.API.Extensions
{
    public static class OrderDetailExtensions
    {
        public static async Task<Coordination> FindCoordination(this TMSContext db, OrderDetail orderDetail)
        {
            return await
            (from composition in db.OrderComposition
             join coor in db.Coordination.Include(x => x.OrderComposition).Include(x => x.CoordinationDetail)
                 on composition.CoordinationId equals coor.Id
             where composition.OrderDetailId == orderDetail.Id
             select coor).FirstOrDefaultAsync();
        }

        public static IQueryable<Coordination> FindCoordination(this TMSContext db, List<int> orderDetailIds)
        {
            return from composition in db.OrderComposition
             join coor in db.Coordination.Include(x => x.OrderComposition).Include(x => x.CoordinationDetail)
                 on composition.CoordinationId equals coor.Id
             where composition.OrderDetailId != null && orderDetailIds.Contains(composition.OrderDetailId.Value)
             select coor;
        }
    }
}
