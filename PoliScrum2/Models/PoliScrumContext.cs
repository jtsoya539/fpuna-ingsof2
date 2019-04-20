using Microsoft.EntityFrameworkCore;

namespace PoliScrum.Models
{
    public class PoliScrumContext : DbContext
    {
        public PoliScrumContext(DbContextOptions<PoliScrumContext> options)
            : base(options)
        {
        }

        public DbSet<PoliScrum.Models.Proyecto> Proyectos { get; set; }
        public DbSet<PoliScrum.Models.Usuario> Usuarios { get; set; }
        public DbSet<PoliScrum.Models.Rol> Roles { get; set; }
        public DbSet<PoliScrum.Models.EstadoProyecto> ProyectoEstados { get; set; }
        public DbSet<PoliScrum.Models.HistoriaUsuario> UserStories { get; set; }
        public DbSet<PoliScrum.Models.ProductBacklog> ProductBacklogs { get; set; }
    }
}