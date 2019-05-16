﻿// <auto-generated />
using System;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Infrastructure;
using Microsoft.EntityFrameworkCore.Storage.ValueConversion;
using Oracle.EntityFrameworkCore.Metadata;
using PoliScrum.Models;

namespace PoliScrum.Migrations
{
    [DbContext(typeof(PoliScrumContext))]
    partial class PoliScrumContextModelSnapshot : ModelSnapshot
    {
        protected override void BuildModel(ModelBuilder modelBuilder)
        {
#pragma warning disable 612, 618
            modelBuilder
                .HasAnnotation("Oracle:ValueGenerationStrategy", OracleValueGenerationStrategy.IdentityColumn)
                .HasAnnotation("ProductVersion", "2.1.8-servicing-32085")
                .HasAnnotation("Relational:MaxIdentifierLength", 128);

            modelBuilder.Entity("PoliScrum.Models.Proyecto", b =>
                {
                    b.Property<int>("ProyectoId")
                        .ValueGeneratedOnAdd();

                    b.Property<DateTime>("FechaFin");

                    b.Property<DateTime>("FechaFinEstimada");

                    b.Property<DateTime>("FechaInicio");

                    b.Property<string>("Nombre")
                        .HasMaxLength(200);

                    b.Property<int?>("ProyectoEstadoId");

                    b.HasKey("ProyectoId");

                    b.HasIndex("ProyectoEstadoId");

                    b.ToTable("PST_PROYECTOS");
                });

            modelBuilder.Entity("PoliScrum.Models.ProyectoEstado", b =>
                {
                    b.Property<int>("ProyectoEstadoId")
                        .ValueGeneratedOnAdd();

                    b.Property<string>("Descripcion")
                        .HasMaxLength(50);

                    b.HasKey("ProyectoEstadoId");

                    b.ToTable("PST_PROYECTO_ESTADOS");
                });

            modelBuilder.Entity("PoliScrum.Models.Sprint", b =>
                {
                    b.Property<int>("SprintId")
                        .ValueGeneratedOnAdd();

                    b.Property<int>("DuracionEstimada");

                    b.Property<DateTime>("FechaFin");

                    b.Property<DateTime>("FechaFinEstimada");

                    b.Property<DateTime>("FechaInicio");

                    b.Property<int?>("ProyectoId");

                    b.HasKey("SprintId");

                    b.HasIndex("ProyectoId");

                    b.ToTable("PST_SPRINTS");
                });

            modelBuilder.Entity("PoliScrum.Models.UserStory", b =>
                {
                    b.Property<int>("UserStoryId")
                        .ValueGeneratedOnAdd();

                    b.Property<string>("CriteriosAceptacion")
                        .HasMaxLength(4000);

                    b.Property<string>("Descripcion")
                        .HasMaxLength(4000);

                    b.Property<int>("DuracionEstimada");

                    b.Property<DateTime>("FechaFin");

                    b.Property<DateTime>("FechaInicio");

                    b.Property<int>("OrdenPrioridad");

                    b.Property<int?>("ProyectoId");

                    b.Property<int?>("SprintId");

                    b.Property<string>("Titulo")
                        .HasMaxLength(200);

                    b.Property<int>("Valor");

                    b.HasKey("UserStoryId");

                    b.HasIndex("ProyectoId");

                    b.HasIndex("SprintId");

                    b.ToTable("PST_USER_STORIES");
                });

            modelBuilder.Entity("PoliScrum.Models.Proyecto", b =>
                {
                    b.HasOne("PoliScrum.Models.ProyectoEstado", "ProyectoEstado")
                        .WithMany("Proyectos")
                        .HasForeignKey("ProyectoEstadoId");
                });

            modelBuilder.Entity("PoliScrum.Models.Sprint", b =>
                {
                    b.HasOne("PoliScrum.Models.Proyecto", "Proyecto")
                        .WithMany("Sprints")
                        .HasForeignKey("ProyectoId");
                });

            modelBuilder.Entity("PoliScrum.Models.UserStory", b =>
                {
                    b.HasOne("PoliScrum.Models.Proyecto", "Proyecto")
                        .WithMany("ProductBacklog")
                        .HasForeignKey("ProyectoId");

                    b.HasOne("PoliScrum.Models.Sprint", "Sprint")
                        .WithMany("SprintBacklog")
                        .HasForeignKey("SprintId");
                });
#pragma warning restore 612, 618
        }
    }
}
