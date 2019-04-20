using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.EntityFrameworkCore;
using PoliScrum.Models;

namespace PoliScrum.Pages.Proyectos
{
    public class IndexModel : PageModel
    {
        private readonly PoliScrum.Models.PoliScrumContext _context;

        public IndexModel(PoliScrum.Models.PoliScrumContext context)
        {
            _context = context;
        }

        public IList<Proyecto> Proyecto { get;set; }

        public async Task OnGetAsync()
        {
            Proyecto = await _context.Proyectos.ToListAsync();
        }
    }
}
