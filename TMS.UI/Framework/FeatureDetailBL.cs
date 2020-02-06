using Common.Clients;
using Common.Extensions;
using Common.ViewModels;
using Components.Forms;
using System;
using System.Threading.Tasks;
using TMS.API.Models;

namespace TMS.UI.Framework
{
    public class FeatureDetailBL : TabEditor<FeatureVM>
    {
        public FeatureDetailBL()
        {
            Name = "Feature editor";
            Entity = new SearchFeatureVM();
            Title = "Feature";
            Icon = "icons/config.png";
        }

        public override async Task<bool> Save(bool defaultMessage = false)
        {
            var client = new Client(nameof(Feature));
            var featureVM = Entity.CastProp<FeatureVM>();
            featureVM.ComponentGroup.ForEach(x =>
            {
                x.Component = null;
            });
            if (Entity != null && Entity[IdField].As<int>() == 0)
            {
                if (Entity["Active"] != null) Entity["Active"] = true;
                SetDeafaultId();
                var data = await client.PostAsync(featureVM, "create");
                ReloadAndShowMessage(defaultMessage, data.CastProp<FeatureVM>(), false);
                AfterSaved?.Invoke(data != null);
            }
            else
            {
                SetDeafaultId();
                var data = await client.UpdateAsync(featureVM, "update");
                ReloadAndShowMessage(defaultMessage, data.CastProp<FeatureVM>(), true);
                AfterSaved?.Invoke(data != null);
            }
            return true;
        }

        public void ComponentGroupDetail(ComponentGroup componentGroup)
        {
            var editor = new TabEditor<ComponentGroup>
            {
                Entity = componentGroup,
                Name = "ComponentGroup",
                Title = $"Component group - {componentGroup?.Name}",
                Icon = "icons/config2.png"
            };
            AddChild(editor);
            editor.Focus();
        }
    }
}
