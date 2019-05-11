using System;
using Microsoft.EntityFrameworkCore.Migrations;
using Oracle.EntityFrameworkCore.Metadata;

namespace PoliScrum.Migrations
{
    public partial class Migracion5 : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.CreateTable(
                name: "PST_USER_STORIES",
                columns: table => new
                {
                    UserStoryId = table.Column<int>(nullable: false)
                        .Annotation("Oracle:ValueGenerationStrategy", OracleValueGenerationStrategy.IdentityColumn),
                    Titulo = table.Column<string>(maxLength: 200, nullable: true),
                    Descripcion = table.Column<string>(maxLength: 4000, nullable: true),
                    CriteriosAceptacion = table.Column<string>(maxLength: 4000, nullable: true),
                    OrdenPrioridad = table.Column<int>(nullable: false),
                    DuracionEstimada = table.Column<int>(nullable: false),
                    Valor = table.Column<int>(nullable: false),
                    FechaInicio = table.Column<DateTime>(nullable: false),
                    FechaFin = table.Column<DateTime>(nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_PST_USER_STORIES", x => x.UserStoryId);
                });
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropTable(
                name: "PST_USER_STORIES");
        }
    }
}
