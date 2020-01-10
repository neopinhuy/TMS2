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
    public class UnitofMeasureBL : TabEditor<UoM>
    {
        public UnitofMeasureBL()
        {
            Name = "Unit of Measure";
            Title = Name;
        }
        public void EditUomType(UoM UoM)
        {
            InitUoMForm(UoM);
        }
        public void CreateUoM()
        {
            InitUoMForm(new UoM());
        }

        private void InitUoMForm(UoM UoM)
        {
            var UoMForm = new PopupEditor<UoM>
            {
                Entity = UoM,
                Name = "UoM Detail",
                Title = "UoM Detail"
            };
            AddChild(UoMForm);
        }
    }
}
