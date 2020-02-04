using System.Collections.Generic;
using TMS.API.Models;

namespace Common.ViewModels
{
    public class SearchFeatureVM
    {
        public string SearchText { get; set; }
        public List<Feature> Feature { get; set; }
    }
}
