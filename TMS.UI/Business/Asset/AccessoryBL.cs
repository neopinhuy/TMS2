﻿using Components;
using Components.Forms;
using TMS.API.Models;

namespace TMS.UI.Business.Asset
{
    public class AccessoryBL : TabEditor<Accessory>
    {
        GridView _accessoryGrid;
        public AccessoryBL() : base()
        {
            Name = "AccessoryTab";
        }

        private void ReloadAccessoryGrid()
        {
            _accessoryGrid = FindComponent("Accessory") as GridView;
            _accessoryGrid.LoadData();
        }

        public void CreateAccessory()
        {
            var accessoryForm = new PopupEditor<Accessory>
            {
                Entity = new Accessory(),
                Name = "Accessory Detail"
            };
            accessoryForm.AfterSaved += ReloadAccessoryGrid;
            AddChild(accessoryForm);
        }

        public void UpdateAccessory(Accessory accessory)
        {
            var accessoryForm = new PopupEditor<Accessory>
            {
                Entity = accessory,
                Name = "Accessory Detail"
            };
            accessoryForm.AfterSaved += ReloadAccessoryGrid;
            AddChild(accessoryForm);
        }

        public void DeleteAccessory()
        {
            _accessoryGrid = FindComponent("Accessory") as GridView;
            _accessoryGrid.DeleteSelected();
        }
    }
}
