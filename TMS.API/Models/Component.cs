using System;
using System.Collections.Generic;

namespace TMS.API.Models
{
    public partial class Component
    {
        public int Id { get; set; }
        public string FieldName { get; set; }
        public int? Order { get; set; }
        public int? PolicyId { get; set; }
        public int? StateId { get; set; }
        public string ComponentType { get; set; }
        public int? ComponentGroupId { get; set; }
        public string DataSourceFilter { get; set; }
        public int? ReferenceId { get; set; }
        public string Format { get; set; }
        public int? Column { get; set; }
        public int? Offset { get; set; }
        public int? Row { get; set; }
        public int? Precision { get; set; }
        public string GroupBy { get; set; }
        public string GroupFormat { get; set; }
        public string Label { get; set; }
        public bool ShowLabel { get; set; }
        public string Icon { get; set; }
        public string ClassName { get; set; }
        public string Style { get; set; }
        public string HotKey { get; set; }
        public string Renderer { get; set; }
        public string Events { get; set; }
        public bool Disabled { get; set; }
        public bool Visibility { get; set; }
        public bool Hidden { get; set; }
        public string Validation { get; set; }
        public bool Focus { get; set; }
        public string Width { get; set; }
        public string MinWidth { get; set; }
        public string MaxWidth { get; set; }
        public string PopulateField { get; set; }
        public string CascadeField { get; set; }
        public bool Active { get; set; }
        public DateTime InsertedDate { get; set; }
        public int InsertedBy { get; set; }
        public DateTime? UpdatedDate { get; set; }
        public int? UpdatedBy { get; set; }

        public virtual ComponentGroup ComponentGroup { get; set; }
        public virtual User InsertedByNavigation { get; set; }
        public virtual Policy Policy { get; set; }
        public virtual Entity Reference { get; set; }
        public virtual FreightState State { get; set; }
        public virtual User UpdatedByNavigation { get; set; }
    }
}
