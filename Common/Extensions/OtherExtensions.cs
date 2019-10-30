using Bridge;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Common.Extensions
{
    public static class OtherExtensions
    {
        [Template("{task}.bind({context})")]
        public static Func<Task> Bind(this Func<Task> task, object context)
        {
            return null;
        }
    }
}
