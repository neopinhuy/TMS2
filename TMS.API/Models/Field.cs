using System;
using System.Collections.Generic;

namespace TMS.API.Models
{
    public partial class Field
    {
        public Field()
        {
            UserInterface = new HashSet<UserInterface>();
        }

        public int Id { get; set; }
        public int EntityId { get; set; }
        public string FieldName { get; set; }
        public string Description { get; set; }
        public string ShortDesc { get; set; }
        public string ColumnType { get; set; }
        public bool AllowNull { get; set; }
        public int? ReferenceId { get; set; }
        public string RefValueField { get; set; }
        public string RefDisplayFields { get; set; }
        public bool Active { get; set; }
        public DateTime InsertedDate { get; set; }
        public int InsertedBy { get; set; }
        public DateTime? UpdatedDate { get; set; }
        public int? UpdatedBy { get; set; }

        public virtual Entity Entity { get; set; }
        public virtual User InsertedByNavigation { get; set; }
        public virtual Entity Reference { get; set; }
        public virtual User UpdatedByNavigation { get; set; }
        public virtual ICollection<UserInterface> UserInterface { get; set; }
    }
}
