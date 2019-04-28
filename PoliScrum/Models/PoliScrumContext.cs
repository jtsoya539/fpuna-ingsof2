using Microsoft.EntityFrameworkCore;

namespace PoliScrum.Models
{
    public class PoliScrumContext : DbContext
    {
        public PoliScrumContext(DbContextOptions<PoliScrumContext> options)
            : base(options)
        {
        }

        public DbSet<Proyecto> Proyectos { get; set; }
        // public DbSet<ProyectoEstado> ProyectoEstados { get; set; }
    }
}