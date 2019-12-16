using Components.Forms;
using System;
using System.Threading.Tasks;
using TMS.API.Models;
using TMS.UI.ViewModels;

namespace TMS.UI.Business
{
    public class LedgerBL : TabEditor<LedgerVM>
    {
        private readonly string _editorName = $"Edit{typeof(Ledger).Name}";
        public LedgerBL()
        {
            Name = "Ledger List";
            Title = "Ledger";
            Entity = new LedgerVM
            {
                FromMonth = DateTime.Now.AddDays(-DateTime.Now.Day + 1)
            };
        }

        public override void Create()
        {
            var popup = new PopupEditor<Ledger>()
            {
                Name = _editorName,
                Title = "New ledger",
            };
            AddChild(popup);
        }

        public void EditLedger(Ledger entity)
        {
            CalcOriginMoney(entity);
            var popup = new PopupEditor<Ledger>()
            {
                Name = _editorName,
                Title = "Edit ledger",
                Entity = entity,
            };
            AddChild(popup);
            popup.Disposed += () => {
                CalcExchangeMoney(entity);
            };
        }

        private static void CalcOriginMoney(Ledger entity)
        {
            entity.Debit /= entity.ExchangeRate;
            entity.Credit /= entity.ExchangeRate;
            entity.OpeningDebit /= entity.ExchangeRate;
            entity.OpeningCredit /= entity.ExchangeRate;
        }

        public async Task SaveLedger()
        {
            var popup = FindComponentByName<PopupEditor<Ledger>>(_editorName);
            var entity = popup.Entity as Ledger;
            CalcExchangeMoney(entity);
            await popup.Save(true);
        }

        private static void CalcExchangeMoney(Ledger entity)
        {
            entity.OriginMoney = entity.Debit ?? entity.Credit;
            entity.Debit *= entity.ExchangeRate;
            entity.Credit *= entity.ExchangeRate;

            entity.OriginOpeningMoney = entity.OpeningDebit ?? entity.OpeningCredit;
            entity.OpeningDebit *= entity.ExchangeRate;
            entity.OpeningCredit *= entity.ExchangeRate;
        }

        public async Task Search()
        {

        }
    }
}
