using Common.Clients;
using Common.Extensions;
using Common.ViewModels;
using Components.Forms;
using System.Threading.Tasks;
using TMS.API.Models;

namespace TMS.UI.Business.Authentication
{
    public class LoginBL : PopupEditor<LoginVM>
    {
        public LoginBL()
        {
            Entity = new LoginVM();
            Name = "Login";
            Title = Name;
        }

        public override void Render()
        {
            base.Render();
            RootHtmlElement.ParentElement.ParentElement.Style.BackgroundColor = "rgba(0,0,0,0.4)";
        }

        public async Task<bool> Login(LoginVM login)
        {
            var result = new Client<User>();
            var res = await result.PostAsync(new User
            {
                UserName = login.UserName,
                Password = login.Password
            }, "Login");
            if (res is null)
            {
                Toast.Warning("Wrong username or password! Please try again!");
            }
            else
            {
                Toast.Success($"Welcome {login.UserName}!");
            }
            return true;
        }
    }
}