using Microsoft.AspNetCore.Cors;
using Microsoft.AspNetCore.Mvc;

namespace LogAPI.Controllers
{
    [ApiController]
    [EnableCors("AllowOrigin")]
    public class BaseController : ControllerBase
    {
    }
}
