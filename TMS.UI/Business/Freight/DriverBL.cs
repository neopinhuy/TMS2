using Components.Forms;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using TMS.API.Models;

namespace TMS.UI.Business.Freight
{
    public class DriverBL : TabEditor<CoordinationDetail>
    {
        public DriverBL()
        {
            Title = "Driver";
            Name = "Driver tasks";
        }
    }
}
