using System.Collections.Generic;
using TMS.API.Models;

namespace Common.ViewModels
{
    public class FeatureVM
    {
        public string SearchText { get; set; }
        public List<Feature> Feature { get; set; }
    }
}
