using MVVM;
using System.Threading.Tasks;

namespace Components
{
    public class FloatingTable<Data> : Table<Data>
    {
        public double Top { get; set; }
        public double Left { get; set; }

        public FloatingTable(TableParam<Data> tableParam) : base(tableParam) { }

        public override async Task RenderAsync()
        {
            await base.RenderAsync();
            Html.Take(RootElement).ClassName("floating")
                .Position(Position.@fixed)
                .Position(Direction.top, Top)
                .Position(Direction.left, Left);
        }
    }
}
