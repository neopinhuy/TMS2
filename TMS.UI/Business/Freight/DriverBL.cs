using Common.Enums;
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
            var grid = FindComponentByName<GridView>(nameof(CoordinationDetail.Surcharge));
            if (grid is null) return null;
            var popup = grid.Parent.As<PopupEditor<CoordinationDetail>>();
            var coorDetail = popup.Entity as CoordinationDetail;
            coorDetail.Surcharge.ForEach(x => {
                if (x.Id < 0) x.Id = 0;
                x.OrderDetailId = coorDetail.PackageId;
            });
            return popup.Save();
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
        
        public async Task SubmitToTransit()
        {
            var popup = FindComponent<PopupEditor<CoordinationDetail>>().FirstOrDefault();
            if (popup is null) return;
            var entity = popup.Entity as CoordinationDetail;
            entity.FreightStateId = (int)FreightStateEnum.Moving;
            var res = await popup.Save(true);
            if (res)
            {
                Toast.Success("Submit succeeded!");
            }
            else
            {
                Toast.Success("Submit failed!");
            }
        }
    }
}
