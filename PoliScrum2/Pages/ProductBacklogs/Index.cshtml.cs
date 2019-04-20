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
    public class IndexModel : PageModel
    {
        private readonly PoliScrum.Models.PoliScrumContext _context;

        public IndexModel(PoliScrum.Models.PoliScrumContext context)
        {
            _context = context;
        }

        public IList<ProductBacklog> ProductBacklog { get;set; }

        public async Task OnGetAsync()
        {
            ProductBacklog = await _context.ProductBacklogs.ToListAsync();
        }
    }
}
