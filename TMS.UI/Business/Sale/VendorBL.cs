using Common.Clients;
using Common.Extensions;
using Common.ViewModels;
using Components;
using Components.Forms;
using System;
using System.Linq;
using System.Threading.Tasks;
using TMS.API.Models;

namespace TMS.UI.Business.Sale
{
    public class VendorBL : TabEditor<Vendor>
    {
        public VendorBL()
        {
            Name = "Vendor List";
            Title = Name;
        }
        public void EditVendor(Vendor Vendor)
        {
            InitVendorForm(Vendor);
        }
        public void CreateVendor(Vendor Vendor)
        {
            InitVendorForm(Vendor);
        }

        private void InitVendorForm(Vendor vendor)
        {
            var vendorForm = new PopupEditor<Vendor>
            {
                Entity = vendor,
                Name = "Vendor Detail",
                Title = "Vendor Detail"
            };
            AddChild(vendorForm);
        }
    }
}