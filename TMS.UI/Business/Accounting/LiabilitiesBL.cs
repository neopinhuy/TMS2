using Bridge.Html5;
using Common.Clients;
using Common.ViewModels;
using Components;
using Components.Forms;
using System;
using System.Linq;
using System.Threading.Tasks;
using TMS.API.Models;

namespace TMS.UI.Business.Accounting
{
    public class LiabilitiesBL : TabEditor<LiabilitiesWarning>
    {
        private readonly LedgerVM _vm;
        private readonly string _editorName = $"Edit{typeof(Ledger).Name}";
        public LiabilitiesBL()
        {
            Name = "Liabilities List";
            Title = "Liabilities";
            //Entity = _vm = new LedgerVM
            //{
            //    FromDate = DateTime.Now.AddDays(-DateTime.Now.Day + 1),
            //};
        }
        public override void Create()
        {
            var popup = new PopupEditor<Ledger>()
            {
                Name = _editorName,
                Title = "New ledger",
                Entity = new Ledger() { ExchangeRate = 1 }
            };
            AddChild(popup);
        }

        public void EditLedger(Ledger entity)
        {
            var popup = new PopupEditor<Ledger>()
            {
                Name = _editorName,
                Title = "Edit ledger",
                Entity = entity,
            };
            AddChild(popup);
            popup.Disabled = true;
        }
    }
}
