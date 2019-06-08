using Microsoft.EntityFrameworkCore.Migrations;
using Oracle.EntityFrameworkCore.Metadata;

namespace PoliScrum.Migrations
{
    public partial class Migracion03 : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.CreateTable(
                name: "PST_ROLES",
                columns: table => new
                {
                    RolId = table.Column<int>(nullable: false)
                        .Annotation("Oracle:ValueGenerationStrategy", OracleValueGenerationStrategy.IdentityColumn),
                    Descripcion = table.Column<string>(maxLength: 100, nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_PST_ROLES", x => x.RolId);
                });

            migrationBuilder.CreateTable(
                name: "PST_USUARIOS",
                columns: table => new
                {
                    UsuarioId = table.Column<int>(nullable: false)
                        .Annotation("Oracle:ValueGenerationStrategy", OracleValueGenerationStrategy.IdentityColumn),
                    Nombre = table.Column<string>(maxLength: 50, nullable: true),
                    Apellido = table.Column<string>(maxLength: 50, nullable: true),
                    Cedula = table.Column<string>(maxLength: 30, nullable: true),
                    CorreoElectronico = table.Column<string>(maxLength: 100, nullable: true),
                    RolId = table.Column<int>(nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_PST_USUARIOS", x => x.UsuarioId);
                    table.ForeignKey(
                        name: "FK_PST_USUARIOS_PST_ROLES_RolId",
                        column: x => x.RolId,
                        principalTable: "PST_ROLES",
                        principalColumn: "RolId",
                        onDelete: ReferentialAction.Restrict);
                });

            migrationBuilder.CreateIndex(
                name: "IX_PST_USUARIOS_RolId",
                table: "PST_USUARIOS",
                column: "RolId");
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropTable(
                name: "PST_USUARIOS");

            migrationBuilder.DropTable(
                name: "PST_ROLES");
        }
    }
}
