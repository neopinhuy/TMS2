﻿using System;
using System.Collections.Generic;

namespace TMS.API.Models
{
    public partial class Entity
    {
        public Entity()
        {
            EntityPolicy = new HashSet<EntityPolicy>();
            FieldEntity = new HashSet<Field>();
            FieldReference = new HashSet<Field>();
            Ledger = new HashSet<Ledger>();
        }

        public int Id { get; set; }
        public string Name { get; set; }
        public bool Active { get; set; }
        public DateTime InsertedDate { get; set; }
        public int InsertedBy { get; set; }
        public DateTime? UpdatedDate { get; set; }
        public int? UpdatedBy { get; set; }

        public virtual User InsertedByNavigation { get; set; }
        public virtual User UpdatedByNavigation { get; set; }
        public virtual ICollection<EntityPolicy> EntityPolicy { get; set; }
        public virtual ICollection<Field> FieldEntity { get; set; }
        public virtual ICollection<Field> FieldReference { get; set; }
        public virtual ICollection<Ledger> Ledger { get; set; }
    }
}
