using System;
using Microsoft.EntityFrameworkCore.Migrations;
using Oracle.EntityFrameworkCore.Metadata;

namespace PoliScrum.Migrations
{
    public partial class Migracion02 : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.CreateTable(
                name: "PST_PROYECTO_ESTADOS",
                columns: table => new
                {
                    ProyectoEstadoId = table.Column<int>(nullable: false)
                        .Annotation("Oracle:ValueGenerationStrategy", OracleValueGenerationStrategy.IdentityColumn),
                    Descripcion = table.Column<string>(maxLength: 50, nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_PST_PROYECTO_ESTADOS", x => x.ProyectoEstadoId);
                });

            migrationBuilder.CreateTable(
                name: "PST_PROYECTOS",
                columns: table => new
                {
                    ProyectoId = table.Column<int>(nullable: false)
                        .Annotation("Oracle:ValueGenerationStrategy", OracleValueGenerationStrategy.IdentityColumn),
                    Nombre = table.Column<string>(maxLength: 200, nullable: true),
                    ProyectoEstadoId = table.Column<int>(nullable: true),
                    FechaInicio = table.Column<DateTime>(nullable: false),
                    FechaFinEstimada = table.Column<DateTime>(nullable: false),
                    FechaFin = table.Column<DateTime>(nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_PST_PROYECTOS", x => x.ProyectoId);
                    table.ForeignKey(
                        name: "FK_PST_PROYECTOS_PST_PROYECTO_ESTADOS_ProyectoEstadoId",
                        column: x => x.ProyectoEstadoId,
                        principalTable: "PST_PROYECTO_ESTADOS",
                        principalColumn: "ProyectoEstadoId",
                        onDelete: ReferentialAction.Restrict);
                });

            migrationBuilder.CreateTable(
                name: "PST_SPRINTS",
                columns: table => new
                {
                    SprintId = table.Column<int>(nullable: false)
                        .Annotation("Oracle:ValueGenerationStrategy", OracleValueGenerationStrategy.IdentityColumn),
                    FechaInicio = table.Column<DateTime>(nullable: false),
                    FechaFinEstimada = table.Column<DateTime>(nullable: false),
                    DuracionEstimada = table.Column<int>(nullable: false),
                    FechaFin = table.Column<DateTime>(nullable: false),
                    ProyectoId = table.Column<int>(nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_PST_SPRINTS", x => x.SprintId);
                    table.ForeignKey(
                        name: "FK_PST_SPRINTS_PST_PROYECTOS_ProyectoId",
                        column: x => x.ProyectoId,
                        principalTable: "PST_PROYECTOS",
                        principalColumn: "ProyectoId",
                        onDelete: ReferentialAction.Restrict);
                });

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
                    Valor = table.Column<int>(nullable: false),
                    FechaInicio = table.Column<DateTime>(nullable: false),
                    DuracionEstimada = table.Column<int>(nullable: false),
                    FechaFin = table.Column<DateTime>(nullable: false),
                    ProyectoId = table.Column<int>(nullable: true),
                    SprintId = table.Column<int>(nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_PST_USER_STORIES", x => x.UserStoryId);
                    table.ForeignKey(
                        name: "FK_PST_USER_STORIES_PST_PROYECTOS_ProyectoId",
                        column: x => x.ProyectoId,
                        principalTable: "PST_PROYECTOS",
                        principalColumn: "ProyectoId",
                        onDelete: ReferentialAction.Restrict);
                    table.ForeignKey(
                        name: "FK_PST_USER_STORIES_PST_SPRINTS_SprintId",
                        column: x => x.SprintId,
                        principalTable: "PST_SPRINTS",
                        principalColumn: "SprintId",
                        onDelete: ReferentialAction.Restrict);
                });

            migrationBuilder.CreateIndex(
                name: "IX_PST_PROYECTOS_ProyectoEstadoId",
                table: "PST_PROYECTOS",
                column: "ProyectoEstadoId");

            migrationBuilder.CreateIndex(
                name: "IX_PST_SPRINTS_ProyectoId",
                table: "PST_SPRINTS",
                column: "ProyectoId");

            migrationBuilder.CreateIndex(
                name: "IX_PST_USER_STORIES_ProyectoId",
                table: "PST_USER_STORIES",
                column: "ProyectoId");

            migrationBuilder.CreateIndex(
                name: "IX_PST_USER_STORIES_SprintId",
                table: "PST_USER_STORIES",
                column: "SprintId");
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropTable(
                name: "PST_USER_STORIES");

            migrationBuilder.DropTable(
                name: "PST_SPRINTS");

            migrationBuilder.DropTable(
                name: "PST_PROYECTOS");

            migrationBuilder.DropTable(
                name: "PST_PROYECTO_ESTADOS");
        }
    }
}
