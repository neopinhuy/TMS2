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

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Style", "IDE1006:Naming Styles", Justification = "<Pending>")]
        public List<T> value { get; set; }

        public static OdataResult<T> Empty
        {
            get
            {
                return new OdataResult<T>
                {
                    odata = new Odata { count = 0, Context = "" },
                    value = new List<T>()
                };
            }
        }
    }
}
