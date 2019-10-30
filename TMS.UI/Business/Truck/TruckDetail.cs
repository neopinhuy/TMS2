using Bridge.Html5;
using Components.Forms;
using Newtonsoft.Json;
using System;
using System.Threading.Tasks;
using TMS.API.Models;

namespace TMS.UI.Business.TruckManagement
{
    public partial class TruckDetail : EditForm<Truck>
    {
        public async Task Save()
        {
            Console.WriteLine(JsonConvert.SerializeObject(Data));
        }
    }
}
