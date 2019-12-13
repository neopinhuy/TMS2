using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MVVM
{
    public static class Extensions
    {
        public static int Indexof(this IEnumerable source, object val)
        {
            var enumerator = source.GetEnumerator();
            var result = -1;
            while (enumerator.Current != val) 
            {
                enumerator.MoveNext();  
                result++;
            }
            return result;
        }
    }
}
