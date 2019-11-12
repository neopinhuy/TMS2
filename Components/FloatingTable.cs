using MVVM;
using System.Threading.Tasks;

namespace Components
{
    public class FloatingTable<Data> : Table<Data>
    {
        public double Top { get; set; }
        public double Left { get; set; }

        public FloatingTable(TableParam<Data> tableParam) : base(tableParam) { }

        public override void Render()
        {
            base.Render();
            Html.Take(RootHtmlElement).ClassName("floating").Floating(Top, Left);
        }
    }
}
