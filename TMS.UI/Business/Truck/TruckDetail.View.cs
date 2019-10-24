using Common.Clients;
using Common.Extensions;
using Components;
using MVVM;
using System.Linq;
using System.Threading.Tasks;
using TMS.API.Models;

namespace TMS.UI.Business.TruckManagement
{
    public partial class TruckDetail : PopupComponent
    {
        public override string Title { get; set; } = "Truck Detail";
        public Truck Truck { get; set; }
        private readonly object _observableTruck;

        public TruckDetail()
        {
            _observableTruck = new object();
        }

        public override async Task RenderAsync()
        {
            await base.RenderAsync();
            // Load UserInterface here
            var uiClient = new BaseClient<UserInterface>();
            var controls = (await uiClient.GetList("$expand=ComponentType,ComponentGroup,Field&$filter=Field/Entity/Name eq 'Truck'")).ToList();
            var groups = controls.DistinctBy(x => x.ComponentGroupId).Select(x => x.ComponentGroup).ToList();
            controls.ForEach(control =>
            {
                control.ComponentGroup.UserInterface.Add(control);
            });

             // Render group
            groups.ForEach(group =>
            {
                Html.Instance.Div.Hidden(group.Hidden).ClassName(group.ClassName).Table.TBody.Render();
                var ui = group.UserInterface.ToArray();
                foreach(var control in ui)
                {
                    if (control.ComponentType.Name == "Input")
                    {
                        _observableTruck[control.Field.FieldName] = new Observable(Truck[control.Field.FieldName]);
                        Html.Instance.Input.Value(_observableTruck[control.Field.FieldName] as Observable<string>);
                    }
                }
            });
        }
    }
}
