using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using PoliScrum.Models;

namespace PoliScrum.Pages.ProductBacklogs
{
    public class EditModel : PageModel
    {
        private readonly PoliScrum.Models.PoliScrumContext _context;

        public EditModel(PoliScrum.Models.PoliScrumContext context)
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

        public async Task<IActionResult> OnPostAsync()
        {
            if (!ModelState.IsValid)
            {
                return Page();
            }

            _context.Attach(ProductBacklog).State = EntityState.Modified;

            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!ProductBacklogExists(ProductBacklog.ID))
                {
                    return NotFound();
                }
                else
                {
                    throw;
                }
            }

            return RedirectToPage("./Index");
        }

        private bool ProductBacklogExists(int id)
        {
            return _context.ProductBacklogs.Any(e => e.ID == id);
        }
    }
}
