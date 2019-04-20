using System;
using Microsoft.EntityFrameworkCore.Migrations;
using Oracle.EntityFrameworkCore.Metadata;

namespace PoliScrum.Migrations
{
    public partial class productUsuario2 : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.CreateTable(
                name: "ProductBacklogs",
                columns: table => new
                {
                    ID = table.Column<int>(nullable: false)
                        .Annotation("Oracle:ValueGenerationStrategy", OracleValueGenerationStrategy.IdentityColumn),
                    FechaCreacion = table.Column<DateTime>(nullable: false),
                    IDProyectoID = table.Column<int>(nullable: true),
                    IDUsuarioResponsableID = table.Column<int>(nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_ProductBacklogs", x => x.ID);
                    table.ForeignKey(
                        name: "FK_ProductBacklogs_Proyectos_IDProyectoID",
                        column: x => x.IDProyectoID,
                        principalTable: "Proyectos",
                        principalColumn: "ID",
                        onDelete: ReferentialAction.Restrict);
                    table.ForeignKey(
                        name: "FK_ProductBacklogs_Usuarios_IDUsuarioResponsableID",
                        column: x => x.IDUsuarioResponsableID,
                        principalTable: "Usuarios",
                        principalColumn: "ID",
                        onDelete: ReferentialAction.Restrict);
                });

            migrationBuilder.CreateTable(
                name: "UserStories",
                columns: table => new
                {
                    ID = table.Column<int>(nullable: false)
                        .Annotation("Oracle:ValueGenerationStrategy", OracleValueGenerationStrategy.IdentityColumn),
                    titulo = table.Column<string>(nullable: true),
                    IDProductBacklogID = table.Column<int>(nullable: true),
                    Descripcion = table.Column<string>(nullable: true),
                    CriterioAceptacion = table.Column<string>(nullable: true),
                    Orden = table.Column<int>(nullable: false),
                    DuracionEstimada = table.Column<int>(nullable: false),
                    Valor = table.Column<int>(nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_UserStories", x => x.ID);
                    table.ForeignKey(
                        name: "FK_UserStories_ProductBacklogs_IDProductBacklogID",
                        column: x => x.IDProductBacklogID,
                        principalTable: "ProductBacklogs",
                        principalColumn: "ID",
                        onDelete: ReferentialAction.Restrict);
                });

            migrationBuilder.CreateIndex(
                name: "IX_ProductBacklogs_IDProyectoID",
                table: "ProductBacklogs",
                column: "IDProyectoID");

            migrationBuilder.CreateIndex(
                name: "IX_ProductBacklogs_IDUsuarioResponsableID",
                table: "ProductBacklogs",
                column: "IDUsuarioResponsableID");

            migrationBuilder.CreateIndex(
                name: "IX_UserStories_IDProductBacklogID",
                table: "UserStories",
                column: "IDProductBacklogID");
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropTable(
                name: "UserStories");

            migrationBuilder.DropTable(
                name: "ProductBacklogs");
        }
    }
}
