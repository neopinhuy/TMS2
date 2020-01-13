using Common.ViewModels;
using Microsoft.AspNet.OData.Query;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Nest;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Threading.Tasks;
using TMS.API.Models;

namespace TMS.API.Controllers
{
    public class UserController : GenericController<User>
    {
        public UserController(TMSContext context, IElasticClient client) : base(context, client)
        {

        }

        [HttpGet("api/User/{groupName}")]
        public async Task<IActionResult> GetUserByGroup(string groupName, ODataQueryOptions<User> options)
        {
            var query =
                from groupRole in db.GroupRole
                join member in db.GroupMember on groupRole.Id equals member.GroupRoleId
                join role in db.Role on member.RoleId equals role.Id
                join user in db.User on role.Id equals user.RoleId
                where groupRole.Name == groupName
                select user;

            var appliedQuery = options.ApplyTo(query) as IQueryable<User>;
            var result = await appliedQuery.ToListAsync();
            return Ok(new OdataResult<User>
            {
                value = result,
                odata = new Odata
                {
                    count = options.Count?.Value == true ? query.Count() : 0
                }
            });
        }

        private const int saltLengthLimit = 20;

        private static byte[] GetSalt(int maximumSaltLength)
        {
            var salt = new byte[maximumSaltLength];
            using (var random = new RNGCryptoServiceProvider())
            {
                random.GetNonZeroBytes(salt);
            }
            return salt;
        }

        [HttpPost("api/[Controller]")]
        public override async Task<ActionResult<User>> CreateAsync([FromBody] User entity)
        {
            // TODO: Check the subscription and the role of user
            entity.Salt = GetSalt(saltLengthLimit).ToString();
            return await base.CreateAsync(entity);
        }

        [HttpPost("api/[Controller]/Login")]
        public async Task<ActionResult<LoginVM>> LoginAsync([FromBody] LoginVM login)
        {
            if (!ModelState.IsValid) return BadRequest(ModelState);
            var settings = await db.MasterData.FirstOrDefaultAsync(x => x.Name == "MaxLoginFailed");
            var parsed = int.TryParse(settings?.Description, out int maxLoginFailed);
            maxLoginFailed = parsed ? maxLoginFailed : 5;
            var matchedUser = await db.User.FirstOrDefaultAsync(user => user.UserName == login.UserName);
            if (matchedUser is null) return Ok(null);
            if (matchedUser.LoginFailedCount > maxLoginFailed)
                return BadRequest($"The account {login.UserName} has been lock! Please contact your administrator to unlock!");
            var hashedPassword = GetHash(SHA256.Create(), login.Password + matchedUser.Salt);
            var existing = await db.User.AnyAsync(user => user.UserName == login.UserName && user.Password == hashedPassword);
            if (!existing)
            {
                matchedUser.LoginFailedCount = matchedUser.LoginFailedCount.HasValue ? matchedUser.LoginFailedCount + 1 : 1;
            }
            else
            {
                matchedUser.LoginFailedCount = 0;
            }
            await db.SaveChangesAsync();
            if (!existing)
                return BadRequest($"Wrong username or password. Please try again! " +
                    $"You still have {maxLoginFailed - matchedUser.LoginFailedCount} attempt");
            return Ok(login);
        }

        [HttpPost("api/[Controller]/Unlock")]
        public async Task<ActionResult<bool>> Unlock([FromBody] LoginVM login)
        {
            // check role to unlock
            await SendRecoveryEmail(login);
            return Ok(true);
        }

        [HttpPost("api/[Controller]/Recovery")]
        public async Task<ActionResult<bool>> SendRecoveryEmail([FromBody] LoginVM login)
        {
            //TODO: send recovery email
            return Ok(true);
        }

        private static string GetHash(HashAlgorithm hashAlgorithm, string input)
        {
            byte[] data = hashAlgorithm.ComputeHash(Encoding.UTF8.GetBytes(input));
            var sBuilder = new StringBuilder();
            for (int i = 0; i < data.Length; i++)
            {
                sBuilder.Append(data[i].ToString("x2"));
            }
            return sBuilder.ToString();
        }
    }
}
