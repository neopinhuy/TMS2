using LogAPI.Attributes;
using Microsoft.AspNetCore.Cors;
using Microsoft.AspNetCore.Mvc;

namespace LogAPI.Controllers
{
    [ApiController]
    [ValidateModel]
    public class BaseController : ControllerBase
    {
    }
}
