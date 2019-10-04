﻿using System;
using System.Threading.Tasks;

namespace Components
{
    public class Header<T>
    {
        public string HeaderText { get; set; }
        public string FieldName { get; set; }
        public string GroupName { get; set; }
        public bool Sortable { get; set; }
        public Type DataType { get; set; }
        public string Format { get; set; }
        public Func<T, Task> EditEvent { get; set; }
        public Func<T, Task> DeleteEvent { get; set; }
    }
}
