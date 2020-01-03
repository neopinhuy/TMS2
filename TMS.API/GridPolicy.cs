using System;
using System.Collections.Generic;

namespace TMS.API
{
    public partial class GridPolicy
    {
        public int Id { get; set; }
        public int? FeatureId { get; set; }
        public int EntityId { get; set; }
        public string FieldName { get; set; }
        public int? Order { get; set; }
        public string ShortDesc { get; set; }
        public string Description { get; set; }
        public int? ReferenceId { get; set; }
        public string DataSource { get; set; }
        public string GroupName { get; set; }
        public string FormatCell { get; set; }
        public string FormatRow { get; set; }
        public string Width { get; set; }
        public string MinWidth { get; set; }
        public string MaxWidth { get; set; }
        public int? Precision { get; set; }
        public string Validation { get; set; }
        public string TextAlign { get; set; }
        public bool Frozen { get; set; }
        public bool Hidden { get; set; }
        public string ButtonEvent { get; set; }
        public string ButtonClass { get; set; }
        public string ButtonIcon { get; set; }
        public bool HasFilter { get; set; }
        public bool Editable { get; set; }
        public bool Disabled { get; set; }
        public string Component { get; set; }
        public int? PolicyId { get; set; }
        public int? StateId { get; set; }
        public string PopulateField { get; set; }
        public string CascadeField { get; set; }
        public string Summary { get; set; }
        public int? SummaryColSpan { get; set; }
        public bool Active { get; set; }
        public DateTime InsertedDate { get; set; }
        public int InsertedBy { get; set; }
        public DateTime? UpdatedDate { get; set; }
        public int? UpdatedBy { get; set; }

        public virtual Entity Entity { get; set; }
        public virtual Feature Feature { get; set; }
        public virtual User InsertedByNavigation { get; set; }
        public virtual Policy Policy { get; set; }
        public virtual Entity Reference { get; set; }
        public virtual FreightState State { get; set; }
        public virtual User UpdatedByNavigation { get; set; }
    }
}
