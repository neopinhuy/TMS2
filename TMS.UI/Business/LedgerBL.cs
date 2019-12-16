using Components.Forms;
using TMS.API.Models;
using TMS.UI.ViewModels;

namespace TMS.UI.Business
{
    public class LedgerBL : TabEditor<LedgerVM>
    {
        public LedgerBL()
        {
            Name = "Ledger List";
            Title = "Ledger";
            Entity = new LedgerVM();
        }

        public override void Create()
        {
            var popup = new PopupEditor<Ledger>()
            {
                Name = $"Edit{typeof(Ledger).Name}",
                Title = "New ledger",
            };
            AddChild(popup);
        }

        public void EditLedger(Ledger ledger)
        {
            var popup = new PopupEditor<Ledger>()
            {
                Name = $"Edit{typeof(Ledger).Name}",
                Title = "Edit ledger",
                Entity = ledger,
            };
            AddChild(popup);
        }
    }
}
