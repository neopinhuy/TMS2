using Common.ViewModels;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Configuration;
using Nest;
using System;
using System.Net.Mail;
using System.Threading.Tasks;
using TMS.API.Models;
using SmtpClient = System.Net.Mail.SmtpClient;

namespace TMS.API.Controllers
{
    public class CustomerCareController : GenericController<CustomerCare>
    {
        private readonly IConfiguration _config;

        public CustomerCareController(TMSContext context, IElasticClient client, IConfiguration config)
            : base(context, client)
        {
            _config = config ?? throw new ArgumentNullException(nameof(config));
        }

        [HttpPost("api/[Controller]/Email")]
        public ActionResult<bool> SendMail([FromBody]EmailVM email)
        {
            var _sender = _config["Email:FromAddress"];
            var _password = _config["Email:Password"];

            var client = new SmtpClient(_config["Email:Server"])
            {
                Port = 587,
                DeliveryMethod = SmtpDeliveryMethod.Network,
                UseDefaultCredentials = false
            };
            var credentials = new System.Net.NetworkCredential(_sender, _password);
            client.EnableSsl = true;
            client.Credentials = credentials;

            try
            {
                var mail = new MailMessage()
                {
                    From = new MailAddress(_sender),
                    Subject = "Test send email with C#",
                    Body = "Nothing here"
                };
                email.ToAddresses?.ForEach(x => mail.To.Add(x));
                client.Send(mail);
                return Ok(true);
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
                throw ex;
            }
        }
    }
}
