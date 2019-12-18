using Common.Clients;
using Components;
using Components.Extensions;
using Components.Forms;
using Newtonsoft.Json;
using System;
using System.Linq;
using System.Threading.Tasks;
using TMS.API.Models;
using TMS.UI.ViewModels;

namespace TMS.UI.Business
{
    public class LedgerBL : TabEditor<LedgerVM>
    {
        private readonly LedgerVM _vm;
        private readonly string _editorName = $"Edit{typeof(Ledger).Name}";
        public LedgerBL()
        {
            Name = "Ledger List";
            Title = "Ledger";
            Entity = _vm = new LedgerVM
            {
                FromDate = DateTime.Now.AddDays(-DateTime.Now.Day + 1),
            };
        }

        public override void Render()
        {
            base.Render();
            AfterRendered += () =>
            {
                var grid = FindComponentByName<GridView>("LedgerGrid");
                grid.RowData.Subscribe(x =>
                {
                    var rows = x.Array as Ledger[];
                    rows.ForEach(SetOriginMoney);
                });
                grid.AfterRendered += async () =>
                {
                    var tr = grid.RootHtmlElement.QuerySelector(".summary");
                    var openingDebit = tr.QuerySelector("td:nth-child(3)");
                    var filter = Entity as LedgerVM;
                    var summary = await Client<Ledger>.Instance
                        .GetList($"/summary?fromDate={filter.FromDate}&toDate={filter.ToDate}&AccountTypeId={filter.AccountTypeId}&TargetTypeId={filter.TargetTypeId}");
                    Console.WriteLine(summary);
                    openingDebit.TextContent = "Open debit";
                    var openingCredit = tr.QuerySelector("td:nth-child(4)");
                    openingCredit.TextContent = "Open credit";
                };
            };
        }

        private static void SetOriginMoney(Ledger le)
        {
            le.OriginMoney = le.OriginCredit ?? le.OriginDebit;
            le.OriginOpeningMoney = le.OriginOpeningCredit ?? le.OriginOpeningDebit;
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

        public async Task SaveLedger()
        {
            var popup = FindComponentByName<PopupEditor<Ledger>>(_editorName);
            var entity = popup.Entity as Ledger;
            entity.Debit = null;
            entity.Credit = null;
            entity.OpeningCredit = null;
            entity.OpeningDebit = null;
            SetOriginMoney(entity);
            await popup.Save(true);
        }

        public async Task Search()
        {
            var grid = FindComponent<GridView>().FirstOrDefault();
            grid?.ReloadData();
        }
    }
}
