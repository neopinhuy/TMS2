using System;
using System.Threading.Tasks;

namespace Components
{
    public class Header<T>
    {
        public string HeaderText { get; set; }
        public string Description { get; set; }
        public string FieldName { get; set; }
        public string Reference { get; set; }
        public string DataSource { get; set; }
        public string RefValueField { get; set; } = "Id";
        public string RefDisplayField { get; set; } = "Name";
        public string GroupName { get; set; }
        public bool HasFilter { get; set; }
        public string Format { get; set; }
        public TextAlign? TextAlign { get; set; }
        public Func<T, Task> EditEvent { get; set; }
        public Func<T, Task> DeleteEvent { get; set; }
    }
}
