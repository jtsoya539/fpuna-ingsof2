using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.EntityFrameworkCore;
using PoliScrum.Models;

namespace PoliScrum.Pages.UserStories
{
    public class IndexModel : PageModel
    {
        private readonly PoliScrum.Models.PoliScrumContext _context;

        public IndexModel(PoliScrum.Models.PoliScrumContext context)
        {
            _context = context;
        }

        public IList<HistoriaUsuario> HistoriaUsuario { get;set; }

        public async Task OnGetAsync()
        {
            HistoriaUsuario = await _context.UserStories.ToListAsync();
        }
    }
}
