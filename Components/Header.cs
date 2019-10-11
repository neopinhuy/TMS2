using System;
using System.Threading.Tasks;

namespace Components
{
    public class Header<T>
    {
        public string HeaderText { get; set; }
        public string FieldName { get; set; }
        public Type Reference { get; set; }
        public string RefValueField { get; set; } = "Id";
        public string RefDisplayField { get; set; } = "Name";
        public string GroupName { get; set; }
        public bool Sortable { get; set; }
        public Type DataType { get; set; }
        public string Format { get; set; }
        public TextAlign? TextAlign { get; set; }
        public Func<T, Task> EditEvent { get; set; }
        public Func<T, Task> DeleteEvent { get; set; }
    }
}
