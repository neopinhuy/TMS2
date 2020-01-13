using System.Collections.Generic;
using TMS.API.Models;

namespace Common.ViewModels
{
    public class MasterDataVM
    {
        public string SearchText { get; set; }
        public IEnumerable<MasterData> MasterData { get; set; }
    }
}
