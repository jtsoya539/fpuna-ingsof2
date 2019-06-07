using Microsoft.EntityFrameworkCore;

namespace PoliScrum.Models
{
    public class PoliScrumContext : DbContext
    {
        public PoliScrumContext(DbContextOptions<PoliScrumContext> options)
            : base(options)
        {
        }

        public DbSet<UserStory> UserStories { get; set; }
        public DbSet<ProyectoEstado> ProyectoEstados { get; set; }
        public DbSet<Proyecto> Proyectos { get; set; }
        public DbSet<Sprint> Sprints { get; set; }
        public DbSet<Usuario> Usuarios { get; set; }
        public DbSet<Rol> Roles { get; set; }
    }
}