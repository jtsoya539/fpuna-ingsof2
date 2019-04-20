using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.AspNetCore.Mvc.Rendering;
using PoliScrum.Models;

namespace PoliScrum.Pages.ProductBacklogs
{
    public class CreateModel : PageModel
    {
        private readonly PoliScrum.Models.PoliScrumContext _context;

        public CreateModel(PoliScrum.Models.PoliScrumContext context)
        {
            _context = context;
        }

        public IActionResult OnGet()
        {
            return Page();
        }

        [BindProperty]
        public ProductBacklog ProductBacklog { get; set; }

        public async Task<IActionResult> OnPostAsync()
        {
            if (!ModelState.IsValid)
            {
                return Page();
            }

            _context.ProductBacklogs.Add(ProductBacklog);
            await _context.SaveChangesAsync();

            return RedirectToPage("./Index");
        }
    }
}