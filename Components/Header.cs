using System;

namespace Components
{
    public class Header<T>
    {
        public string HeaderText { get; set; }
        public string FieldName { get; set; }
        public string GroupName { get; set; }
        public bool ShowSort { get; set; }
        public Type DataType { get; set; }
        public string Format { get; set; }
        public bool EditButton { get; set; }
        public bool DeleteButton { get; set; }
        public Action<T> EditEvent { get; set; }
    }
}
