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
    public class UserBL : TabEditor<User>
    {
        public UserBL()
        {
            Name = "User List";
            Title = Name;
        }
        public void EditUser(User User)
        {
            InitUserForm(User);
        }
        public void CreateUser(User User)
        {
            InitUserForm(User);
        }

        private void InitUserForm(User user)
        {
            var userForm = new PopupEditor<User>
            {
                Entity = user,
                Name = "User Detail",
                Title = "User Detail"
            };
            AddChild(userForm);
        }
    }
}
