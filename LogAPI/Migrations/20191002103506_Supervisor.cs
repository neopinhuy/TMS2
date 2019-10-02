using Microsoft.EntityFrameworkCore.Migrations;

namespace LogAPI.Migrations
{
    public partial class Supervisor : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.AddColumn<int>(
                name: "SupervisorId",
                table: "User",
                nullable: true);

            migrationBuilder.CreateIndex(
                name: "IX_User_SupervisorId",
                table: "User",
                column: "SupervisorId");

            migrationBuilder.AddForeignKey(
                name: "FK_User_User_SupervisorId",
                table: "User",
                column: "SupervisorId",
                principalTable: "User",
                principalColumn: "Id",
                onDelete: ReferentialAction.Restrict);
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_User_User_SupervisorId",
                table: "User");

            migrationBuilder.DropIndex(
                name: "IX_User_SupervisorId",
                table: "User");

            migrationBuilder.DropColumn(
                name: "SupervisorId",
                table: "User");
        }
    }
}
