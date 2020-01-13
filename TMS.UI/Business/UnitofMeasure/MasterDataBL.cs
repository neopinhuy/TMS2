using Common.Clients;
using Common.Extensions;
using Common.ViewModels;
using Components;
using Components.Forms;
using System;
using System.Linq;
using System.Threading.Tasks;
using TMS.API.Models;

namespace TMS.UI.Business.UnitofMeaure
{
    public class MasterDataBL : TabEditor<MasterData>
    {
        public MasterDataBL()
        {
            Name = "Master Data";
            Title = Name;
        }
        public void EditMasterData(MasterData masterData)
        {
            InitMasterDataForm(masterData);
        }
        private void InitMasterDataForm(MasterData masterData)
        {
            var MasterDataForm = new PopupEditor<MasterData>
            {
                Entity = masterData,
                Name = "MasterData Detail",
                Title = "MasterData Detail"
            };
            AddChild(MasterDataForm);
        }

    }
}
