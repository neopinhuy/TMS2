using TMS.API.Models;

namespace Common.ViewModels
{
    public class CustomerCareVM : CustomerCare
    {
        public CustomerCareLog CustomerCareLog { get; set; }
        public LedgerVM LedgerFilter { get; set; }
    }
}
