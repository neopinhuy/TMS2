using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Components
{
    public class TableMetadata
    {
        public string Header { get; set; }
        public string FieldName { get; set; }
        public bool ShowSort { get; set; }
        public Type DataType { get; set; }
        public string Format { get; set; }
    }
}
