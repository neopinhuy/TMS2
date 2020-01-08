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
    public class GroupRoleBL : TabEditor<GroupRole>
    {
        public GroupRoleBL()
        {
            Name = "GroupRole List";
            Title = Name;
        }
        public void EditGroupRole(GroupRole GroupRole)
        {
            InitGroupRoleForm(GroupRole);
        }
        public void CreateGroupRole(GroupRole GroupRole)
        {
            InitGroupRoleForm( new GroupRole());
        }

        private void InitGroupRoleForm(GroupRole groupRole)
        {
            var groupRoleForm = new PopupEditor<GroupRole>
            {
                Entity = groupRole,
                Name = "GroupRole Detail",
                Title = "GroupRole Detail"
            };
            AddChild(groupRoleForm);
        }
    }
}
