using System.Collections.Generic;

namespace TMS.API.Models
{
    public class Odata
    {
        public int Count { get; set; }
        public string Context { get; set; }
    }

    public class OdataResult<T>
    {
        public Odata Odata { get; set; }
        public List<T> Value { get; set; }
    }
}
