using Common.Extensions;
using Components;
using Components.Forms;
using System;
using System.Linq;
using System.Threading.Tasks;
using TMS.API.Models;

namespace TMS.UI.Business.Freight
{
    public class DriverBL : TabEditor<CoordinationDetail>
    {
        public DriverBL()
        {
            Title = "Transit";
            Name = "Driver tasks";
        }

        public Task SaveCoorDetail()
        {
            var grid = FindComponent<GridView>("Surcharge");
            if (grid is null) return null;
            var coorDetail = grid.Parent.Entity as CoordinationDetail;
            coorDetail.Surcharge.ForEach(x => {
                if (x.Id < 0) x.Id = 0;
                x.OrderId = coorDetail.Coordination.OrderId;
                x.OrderDetailId = coorDetail.PackageId;
            });
            return grid.Parent.As<PopupEditor<CoordinationDetail>>().Save();
        }

        public void Transit(CoordinationDetail coordinationDetail)
        {
            var popup = new PopupEditor<CoordinationDetail>()
            {
                Entity = coordinationDetail,
                Name = "CoordinationTransit",
                Title = "Prepare for Transit"
            };
            AddChild(popup);
        }
    }
}
