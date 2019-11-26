using Microsoft.EntityFrameworkCore;
using System.Linq;
using TMS.API.Models;

namespace TMS.API.Extensions
{
    public static class DbExtension
    {
        public static void RemoveEmptyCoordination(this TMSContext db)
        {
            var deleting =
                from coor in db.Coordination.Include(x => x.CoordinationDetail).Include(x => x.OrderComposition)
                join compositionLeft in db.OrderComposition on coor.Id equals compositionLeft.CoordinationId
                    into compositionLeftJoin
                from composition in compositionLeftJoin.DefaultIfEmpty()
                where composition == null
                select coor;
            db.CoordinationDetail.RemoveRange(deleting.SelectMany(x => x.CoordinationDetail));
            db.Coordination.RemoveRange(deleting);
        }
    }
}
