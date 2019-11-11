using Microsoft.EntityFrameworkCore;
using System.Linq;

namespace TMS.API.Extensions
{
    public static class EFExtensions
    {
        public static bool HasTracked<TEntity>(this DbContext context, TEntity entity) 
            where TEntity : class
        {
            return context.Set<TEntity>().Local.Any(e => e == entity);
        }

    }
}
