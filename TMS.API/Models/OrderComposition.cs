using Newtonsoft.Json;
using System;
using System.Collections.Generic;

namespace TMS.API.Models
{
    public partial class OrderComposition
    {
        public int CoordinationId { get; set; }
        public int OrderDetailId { get; set; }

        [JsonIgnore]
        public virtual Coordination Coordination { get; set; }
        
        [JsonIgnore]
        public virtual OrderDetail OrderDetail { get; set; }
    }
}
