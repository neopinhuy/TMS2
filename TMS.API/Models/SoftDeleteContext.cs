using System;
using System.Threading;
using System.Threading.Tasks;
using Microsoft.EntityFrameworkCore;

namespace TMS.API.Models
{
    public partial class TMSContext
    {
        public override int SaveChanges()
        {
            SetDefaultValues();
            return base.SaveChanges();
        }

        public override Task<int> SaveChangesAsync(CancellationToken cancellationToken = default)
        {
            SetDefaultValues();
            return base.SaveChangesAsync(cancellationToken);
        }

        private void SetDefaultValues()
        {
            foreach (var entry in ChangeTracker.Entries())
            {
                switch (entry.State)
                {
                    case EntityState.Added:
                        entry.CurrentValues["InsertedDate"] = DateTime.Now;
                        entry.CurrentValues["Active"] = true;
                        break;
                    case EntityState.Modified:
                        entry.CurrentValues["UpdatedDate"] = DateTime.Now;
                        break;
                    case EntityState.Deleted:
                        entry.State = EntityState.Modified;
                        entry.CurrentValues["Active"] = false;
                        break;
                }
            }
        }
    }
}
