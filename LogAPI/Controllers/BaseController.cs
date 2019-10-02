using LogAPI.Attributes;
using Microsoft.AspNetCore.Cors;
using Microsoft.AspNetCore.Mvc;

namespace LogAPI.Controllers
{
    [ApiController]
    [EnableCors("AllowOrigin")]
    [ValidateModel]
    public class BaseController : ControllerBase
    {
    }
}
