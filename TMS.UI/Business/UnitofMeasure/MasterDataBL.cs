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
    public class MasterDataBL : TabEditor<UoM>
    {
        public MasterDataBL()
        {
            Name = "Master Data";
            Title = Name;
        }

    }
}
