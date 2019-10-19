using System;
using System.Collections.Generic;

namespace TMS.API.Models
{
    public partial class OrderComposition
    {
        public int CoordinationId { get; set; }
        public int OrderDetailId { get; set; }

        public virtual Coordination Coordination { get; set; }
        public virtual OrderDetail OrderDetail { get; set; }
    }
}
