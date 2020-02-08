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
                    if (x.Array is null) return;
                    var rows = x.Array as Ledger[];
                    rows.ForEach(SetOriginMoney);
                });
                grid.AfterRendered += async () =>
                {
                    var filter = Entity as LedgerVM;
                    var summary = await Client<Ledger>.Instance
                        .GetList($"/summary?fromDate={filter.FromDate}&toDate={filter.ToDate}&AccountTypeId={filter.AccountTypeId}" +
                        $"&TargetTypeId={filter.TargetTypeId}&TargetId={filter.TargetId}");
                    var opening = summary.value.FirstOrDefault();
                    var closing = summary.value.LastOrDefault();
                    if (opening is null || closing is null) return;

                    var tr = grid.RootHtmlElement.QuerySelector(".summary") as HTMLTableRowElement;
                    tr.Cells[2].TextContent = string.Format("{0:n}", opening.OpeningDebit);
                    tr.Cells[3].TextContent = string.Format("{0:n}", opening.OpeningCredit);

                    tr = tr.NextElementSibling as HTMLTableRowElement;
                    tr.Cells[2].TextContent = string.Format("{0:n}", closing.OpeningDebit);
                    tr.Cells[3].TextContent = string.Format("{0:n}", closing.OpeningCredit);
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
            entity.ReceiverFullName = popup.FindComponentByName<SearchEntry>(nameof(Ledger.TargetId))?.Text;
            await popup.Save(true);
        }

        public void Search()
        {
            var grid = FindComponent<GridView>().FirstOrDefault();
            grid?.ReloadData();
        }

        public void Preview(Ledger ledger)
        {
            var preview = new PopupEditor<Ledger>
            {
                Entity = ledger,
                Name = "Receipt Preview",
                Title = "Receipt preview"
            };
            AddChild(preview);
        }
        public void PreviewAndPrintLedger(Ledger ledger)
        {
            var preview = new PopupEditor<Ledger>
            {
                Entity = ledger,
                Name = "Print Preview Liabilities",
                Title = "Print Preview Liabilities"
            };
            preview.AfterRendered += () =>
            {
                var grid = FindComponentByName<GridView>("LedgerGridPreview");
                grid.RowData.Subscribe(x =>
                {
                    if (x.Array is null) return;
                    var rows = x.Array as Ledger[];
                    rows.ForEach(SetOriginMoney);
                });
                grid.AfterRendered += async () =>
                {
                    var filter = Entity as LedgerVM;
                    var summary = await Client<Ledger>.Instance
                        .GetList($"/summary?fromDate={filter.FromDate}&toDate={filter.ToDate}&AccountTypeId={filter.AccountTypeId}" +
                        $"&TargetTypeId={filter.TargetTypeId}&TargetId={filter.TargetId}");
                    var opening = summary.value.FirstOrDefault();
                    var closing = summary.value.LastOrDefault();
                    if (opening is null || closing is null) return;

                    var tr = grid.RootHtmlElement.QuerySelector(".summary") as HTMLTableRowElement;
                    tr.Cells[2].TextContent = string.Format("{0:n}", opening.OpeningDebit);
                    tr.Cells[3].TextContent = string.Format("{0:n}", opening.OpeningCredit);

                    tr = tr.NextElementSibling as HTMLTableRowElement;
                    tr.Cells[2].TextContent = string.Format("{0:n}", closing.OpeningDebit);
                    tr.Cells[3].TextContent = string.Format("{0:n}", closing.OpeningCredit);
                };
            };
            AddChild(preview);
        }
    }
}
