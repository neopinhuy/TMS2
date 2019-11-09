﻿using System;
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
        public string GroupName { get; set; }
        public bool HasFilter { get; set; }
        public bool Editable { get; set; }
        public bool Disabled { get; set; }
        public string Format { get; set; }
        public string Icon { get; set; }
        public string Component { get; set; }
        public int? Order { get; set; }
        public bool StatusBar { get; set; }
        public bool Frozen { get; set; }
        public TextAlign? TextAlign { get; set; }
        public Func<T, Task> EditEvent { get; set; }
        public Func<T, Task> DeleteEvent { get; set; }
    }
}
