using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace TMS.API.Controllers
{
    [Route("api/[controller]")]
    public class FileController : Controller
    {
        private readonly IHostingEnvironment _host;

        public FileController(IHostingEnvironment host)
        {
            _host = host ?? throw new ArgumentNullException(nameof(host));
        }

        [HttpPost]
        public async Task<IActionResult> PostAsync(List<IFormFile> files)
        {
            foreach (var file in files)
            {
                var path = GetPath(file);
                var dir = Path.GetDirectoryName(path);
                if (!Directory.Exists(dir))
                {
                    Directory.CreateDirectory(dir);
                }
                using (var stream = System.IO.File.Create(path))
                {
                    await file.CopyToAsync(stream);
                }
            }
            return Ok(files.Select(GetPublicPath));
        }

        private string GetPath(IFormFile formFile)
        {
            return Path.Combine(_host.WebRootPath, "upload", formFile.FileName);
        }

        private string GetPublicPath(IFormFile formFile)
        {
            return Path.Combine("upload", formFile.FileName).Replace("\\", "/");
        }
    }
}