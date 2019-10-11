using TMS.API.Attributes;
using Microsoft.AspNetCore.Mvc;

namespace TMS.API.Controllers
{
    [ApiController]
    [ValidateModel]
    public class BaseController : ControllerBase
    {
    }
}
