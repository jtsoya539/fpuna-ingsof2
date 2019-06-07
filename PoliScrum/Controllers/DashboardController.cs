using System.Threading.Tasks;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using PoliScrum.Models;

namespace PoliScrum.Controllers
{
    [Authorize]
    public class DashboardController : Controller
    {
        private readonly PoliScrumContext _context;

        public DashboardController(PoliScrumContext context)
        {
            _context = context;
        }

        // GET: Dashboard/ProductBacklog/5
        public async Task<IActionResult> ProductBacklog(int? id)
        {
            Proyecto proyecto;
            if (id == null)
            {
                proyecto = await _context.Proyectos
                .Include(m => m.ProyectoEstado)
                .Include(m => m.Sprints)
                .Include(m => m.ProductBacklog)
                .FirstOrDefaultAsync(m => m.ProyectoId > 0);
            }
            else
            {
                proyecto = await _context.Proyectos
                .Include(m => m.ProyectoEstado)
                .Include(m => m.Sprints)
                .Include(m => m.ProductBacklog)
                .FirstOrDefaultAsync(m => m.ProyectoId == id);
            }

            return View(proyecto);
        }

        // GET: Dashboard/SprintBacklog/5
        public async Task<IActionResult> SprintBacklog(int? id)
        {
            Sprint sprint;
            if (id == null)
            {
                sprint = await _context.Sprints
                .Include(m => m.SprintBacklog)
                .FirstOrDefaultAsync(m => m.SprintId > 0);
            }
            else
            {
                sprint = await _context.Sprints
               .Include(m => m.SprintBacklog)
               .FirstOrDefaultAsync(m => m.SprintId == id);
            }

            return View(sprint);
        }


    }
}