using Bridge.Html5;
using Common.Clients;
using Common.ViewModels;
using Components;
using Components.Forms;
using System;
using System.Linq;
using System.Threading.Tasks;
using TMS.API.Models;

namespace TMS.UI.Business.Accounting
{
    public class LiabilitiesBL : TabEditor<LiabilitiesWarning>
    {
        public LiabilitiesBL()
        {
            Name = "Liabilities List";
            Title = "Liabilities";
        }
        public void Search()
        {
            var grid = FindComponent<GridView>().FirstOrDefault();
            grid?.ReloadData();
        }
    }
}
