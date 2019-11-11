using Components;
using Components.Forms;
using TMS.API.Models;

namespace TMS.UI.Business.Asset
{
    public class ContainerBL : TabEditor<Container>
    {
        private PopupEditor<Container> _ContainerForm;

        public ContainerBL()
        {
            Name = "Container";
            Title = Name;
        }

        #region Container

        public void CreateContainer()
        {
            InitContainerForm(new Container());
        }

        public void EditContainer(Container Container)
        {
            InitContainerForm(Container);
        }

        private void InitContainerForm(Container container)
        {
            _ContainerForm = new PopupEditor<Container>
            {
                Entity = container,
                Name = "Container Editor",
                Title = "Container"
            };
            _ContainerForm.AfterSaved += ReloadContainerGrid;
            AddChild(_ContainerForm);
        }

        public void DeleteContainer()
        {
            var ContainerGrid = FindComponent("ContainerGrid") as GridView;
            ContainerGrid.DeleteSelected();
        }

        private void ReloadContainerGrid()
        {
            var ContainerGrid = FindComponent("ContainerGrid") as GridView;
            ContainerGrid.LoadData();
        }

        #endregion Container
    }
}
