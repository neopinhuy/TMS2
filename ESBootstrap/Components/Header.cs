using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Components
{
    public class Header<T>
    {
        public string HeaderText { get; set; }
        public string FieldName { get; set; }
        public bool ShowSort { get; set; }
        public Type DataType { get; set; }
        public string Format { get; set; }
        public bool EditButton { get; set; }
        public bool DeleteButton { get; set; }
        public Action<T> EditEvent { get; set; }
    }
}
