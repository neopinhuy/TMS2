using Common.Clients;
using Common.Extensions;
using Common.ViewModels;
using Components.Forms;
using System.Threading.Tasks;

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
        
        public async Task<bool> Login(LoginVM login)
        {
            var result = new Client("User");
            var res = await result.UpdateAsync(login);
            if (res is null)
            {
                Toast.Warning("Login failed! Please try again!");
            }
            else
            {
                Toast.Warning($"Welcome {login.Username}!");
            }
            return true;
        }
    }
}