using Common.Clients;
using Common.ViewModels;
using Components.Forms;
using System;
using System.Threading.Tasks;
using TMS.API.Models;

namespace TMS.UI.Business.Authentication
{
    public class LoginBL : TabEditor<LoginVM>
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
            await result.UpdateAsync(login);
            Console.WriteLine(login.Username);
            Console.WriteLine(login.Password);
            return true;
        }
    }
}