using Microsoft.EntityFrameworkCore.Migrations;

namespace LogAPI.Migrations
{
    public partial class DecimalTypeForMoney : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.AlterColumn<decimal>(
                name: "Price",
                table: "TruckMaintenanceDetail",
                type: "decimal(20, 5)",
                nullable: false,
                oldClrType: typeof(double));

            migrationBuilder.AlterColumn<decimal>(
                name: "AdvancedPaid",
                table: "TruckMaintenance",
                type: "decimal(20, 5)",
                nullable: false,
                oldClrType: typeof(double));

            migrationBuilder.AlterColumn<decimal>(
                name: "Price",
                table: "Truck",
                type: "decimal(20, 5)",
                nullable: false,
                oldClrType: typeof(double));

            migrationBuilder.AlterColumn<decimal>(
                name: "Price",
                table: "Surcharge",
                type: "decimal(20, 5)",
                nullable: false,
                oldClrType: typeof(double));

            migrationBuilder.AlterColumn<decimal>(
                name: "Price",
                table: "Quotation",
                type: "decimal(20, 5)",
                nullable: false,
                oldClrType: typeof(double));

            migrationBuilder.AlterColumn<decimal>(
                name: "Price",
                table: "OrderDetail",
                type: "decimal(20, 5)",
                nullable: false,
                oldClrType: typeof(double));

            migrationBuilder.AlterColumn<decimal>(
                name: "AdvancedPaid",
                table: "ContainerMaintenance",
                type: "decimal(20, 5)",
                nullable: false,
                oldClrType: typeof(double));

            migrationBuilder.AlterColumn<decimal>(
                name: "Price",
                table: "Accessory",
                type: "decimal(20, 5)",
                nullable: false,
                oldClrType: typeof(double));
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.AlterColumn<double>(
                name: "Price",
                table: "TruckMaintenanceDetail",
                nullable: false,
                oldClrType: typeof(decimal),
                oldType: "decimal(20, 5)");

            migrationBuilder.AlterColumn<double>(
                name: "AdvancedPaid",
                table: "TruckMaintenance",
                nullable: false,
                oldClrType: typeof(decimal),
                oldType: "decimal(20, 5)");

            migrationBuilder.AlterColumn<double>(
                name: "Price",
                table: "Truck",
                nullable: false,
                oldClrType: typeof(decimal),
                oldType: "decimal(20, 5)");

            migrationBuilder.AlterColumn<double>(
                name: "Price",
                table: "Surcharge",
                nullable: false,
                oldClrType: typeof(decimal),
                oldType: "decimal(20, 5)");

            migrationBuilder.AlterColumn<double>(
                name: "Price",
                table: "Quotation",
                nullable: false,
                oldClrType: typeof(decimal),
                oldType: "decimal(20, 5)");

            migrationBuilder.AlterColumn<double>(
                name: "Price",
                table: "OrderDetail",
                nullable: false,
                oldClrType: typeof(decimal),
                oldType: "decimal(20, 5)");

            migrationBuilder.AlterColumn<double>(
                name: "AdvancedPaid",
                table: "ContainerMaintenance",
                nullable: false,
                oldClrType: typeof(decimal),
                oldType: "decimal(20, 5)");

            migrationBuilder.AlterColumn<double>(
                name: "Price",
                table: "Accessory",
                nullable: false,
                oldClrType: typeof(decimal),
                oldType: "decimal(20, 5)");
        }
    }
}
