using Components.Forms;
using TMS.API.Models;

namespace TMS.UI.Business.Sale
{
    public class GroupMemberBL : TabEditor<GroupMember>
    {
        public GroupMemberBL()
        {
            Name = "GroupMember List";
            Title = Name;
        }

        public void EditGroupMember(GroupMember GroupMember)
        {
            InitGroupMemberForm(GroupMember);
        }

        public void CreateGroupMember()
        {
            InitGroupMemberForm(new GroupMember());
        }

        private void InitGroupMemberForm(GroupMember groupMember)
        {
            var groupMemberForm = new PopupEditor<GroupMember>
            {
                Entity = groupMember,
                Name = "GroupMember Detail",
                Title = "GroupMember Detail"
            };
            AddChild(groupMemberForm);
        }
    }
}
