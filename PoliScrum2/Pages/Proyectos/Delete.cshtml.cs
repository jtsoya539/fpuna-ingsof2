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
    public class DeleteModel : PageModel
    {
        private readonly PoliScrum.Models.PoliScrumContext _context;

        public DeleteModel(PoliScrum.Models.PoliScrumContext context)
        {
            _context = context;
        }

        [BindProperty]
        public Proyecto Proyecto { get; set; }

        public async Task<IActionResult> OnGetAsync(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            Proyecto = await _context.Proyectos.FirstOrDefaultAsync(m => m.ID == id);

            if (Proyecto == null)
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

            Proyecto = await _context.Proyectos.FindAsync(id);

            if (Proyecto != null)
            {
                _context.Proyectos.Remove(Proyecto);
                await _context.SaveChangesAsync();
            }

            return RedirectToPage("./Index");
        }
    }
}
