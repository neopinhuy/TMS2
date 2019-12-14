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
            var popup = PreparedataForSave();
            return popup.Save(true);
        }

        private PopupEditor<CoordinationDetail> PreparedataForSave()
        {
            var grid = FindComponentByName<GridView>(nameof(CoordinationDetail.Surcharge));
            if (grid is null) return null;
            var popup = grid.Parent.As<PopupEditor<CoordinationDetail>>();

            var coorDetail = popup.Entity as CoordinationDetail;
            coorDetail.Surcharge.ForEach(x =>
            {
                if (x.Id < 0) x.Id = 0;
                x.OrderId = coorDetail.Package?.OrderId ?? 0;
                x.OrderDetailId = coorDetail.PackageId;
            });
            return popup;
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
            var popup = PreparedataForSave();
            popup.Entity.As<CoordinationDetail>().FreightStateId = (int)FreightStateEnum.InTransit;
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
