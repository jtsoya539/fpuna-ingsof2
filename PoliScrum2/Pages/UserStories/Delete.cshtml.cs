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
    public class DeleteModel : PageModel
    {
        private readonly PoliScrum.Models.PoliScrumContext _context;

        public DeleteModel(PoliScrum.Models.PoliScrumContext context)
        {
            _context = context;
        }

        [BindProperty]
        public HistoriaUsuario HistoriaUsuario { get; set; }

        public async Task<IActionResult> OnGetAsync(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            HistoriaUsuario = await _context.UserStories.FirstOrDefaultAsync(m => m.ID == id);

            if (HistoriaUsuario == null)
            {
                return NotFound();
            }
            return Page();
        }

        public async Task<IActionResult> OnPostAsync(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            HistoriaUsuario = await _context.UserStories.FindAsync(id);

            if (HistoriaUsuario != null)
            {
                _context.UserStories.Remove(HistoriaUsuario);
                await _context.SaveChangesAsync();
            }

            return RedirectToPage("./Index");
        }
    }
}
