using System.Collections.Generic;
using TMS.API.Models;

namespace Common.ViewModels
{
    public class FeatureVM : Feature
    {
        public ICollection<Component> Component { get; set; }
    }
}
