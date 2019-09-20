using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using static Retyped.canvasjs.CanvasJS;

namespace LogContract.Models
{
    public class SaleLeaderBoardDataPoint : ChartDataPoint
    {
        public double gdp { get; set; }
        public string url { get; set; }
    }
}
