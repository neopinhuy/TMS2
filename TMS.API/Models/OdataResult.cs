using System.Collections.Generic;

namespace TMS.API.Models
{
    public class Odata
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Style", "IDE1006:Naming Styles", Justification = "<Pending>")]
        public int? count { get; set; }
        public string Context { get; set; }
    }

    public class OdataResult<T>
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Style", "IDE1006:Naming Styles", Justification = "<Pending>")]
        public Odata odata { get; set; }
        public List<T> Value { get; set; }
    }
}
