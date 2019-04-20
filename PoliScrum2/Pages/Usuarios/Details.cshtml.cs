using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.EntityFrameworkCore;
using PoliScrum.Models;

namespace PoliScrum.Pages.Usuarios
{
    public class DetailsModel : PageModel
    {
        private readonly PoliScrum.Models.PoliScrumContext _context;

        public DetailsModel(PoliScrum.Models.PoliScrumContext context)
        {
            _context = context;
        }

        public Usuario Usuario { get; set; }

        public async Task<IActionResult> OnGetAsync(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            Usuario = await _context.Usuarios.FirstOrDefaultAsync(m => m.ID == id);

            if (Usuario == null)
            {
                return NotFound();
            }
            return Page();
        }
    }
}
