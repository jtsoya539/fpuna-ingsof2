using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.EntityFrameworkCore;
using PoliScrum.Models;

namespace PoliScrum.Pages.ProductBacklogs
{
    public class DeleteModel : PageModel
    {
        private readonly PoliScrum.Models.PoliScrumContext _context;

        public DeleteModel(PoliScrum.Models.PoliScrumContext context)
        {
            _context = context;
        }

        [BindProperty]
        public ProductBacklog ProductBacklog { get; set; }

        public async Task<IActionResult> OnGetAsync(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            ProductBacklog = await _context.ProductBacklogs.FirstOrDefaultAsync(m => m.ID == id);

            if (ProductBacklog == null)
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

            ProductBacklog = await _context.ProductBacklogs.FindAsync(id);

            if (ProductBacklog != null)
            {
                _context.ProductBacklogs.Remove(ProductBacklog);
                await _context.SaveChangesAsync();
            }

            return RedirectToPage("./Index");
        }
    }
}
