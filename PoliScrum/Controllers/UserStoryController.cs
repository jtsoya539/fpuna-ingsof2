using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using PoliScrum.Models;

namespace PoliScrum.Controllers
{
    public class UserStoryController : Controller
    {
        private readonly PoliScrumContext _context;

        public UserStoryController(PoliScrumContext context)
        {
            _context = context;
        }

        // GET: UserStory
        public async Task<IActionResult> Index()
        {
            return View(await _context.UserStories.ToListAsync());
        }

        // GET: UserStory/Details/5
        public async Task<IActionResult> Details(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var userStory = await _context.UserStories
                .FirstOrDefaultAsync(m => m.UserStoryId == id);
            if (userStory == null)
            {
                return NotFound();
            }

            return View(userStory);
        }

        // GET: UserStory/Create
        public IActionResult Create()
        {
            return View();
        }

        // POST: UserStory/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create([Bind("UserStoryId,Titulo,Descripcion,CriteriosAceptacion,OrdenPrioridad,DuracionEstimada,Valor,FechaInicio,FechaFin")] UserStory userStory)
        {
            if (ModelState.IsValid)
            {
                _context.Add(userStory);
                await _context.SaveChangesAsync();
                return RedirectToAction(nameof(Index));
            }
            return View(userStory);
        }

        // GET: UserStory/Edit/5
        public async Task<IActionResult> Edit(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var userStory = await _context.UserStories.FindAsync(id);
            if (userStory == null)
            {
                return NotFound();
            }
            return View(userStory);
        }

        // POST: UserStory/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Edit(int id, [Bind("UserStoryId,Titulo,Descripcion,CriteriosAceptacion,OrdenPrioridad,DuracionEstimada,Valor,FechaInicio,FechaFin")] UserStory userStory)
        {
            if (id != userStory.UserStoryId)
            {
                return NotFound();
            }

            if (ModelState.IsValid)
            {
                try
                {
                    _context.Update(userStory);
                    await _context.SaveChangesAsync();
                }
                catch (DbUpdateConcurrencyException)
                {
                    if (!UserStoryExists(userStory.UserStoryId))
                    {
                        return NotFound();
                    }
                    else
                    {
                        throw;
                    }
                }
                return RedirectToAction(nameof(Index));
            }
            return View(userStory);
        }

        // GET: UserStory/Delete/5
        public async Task<IActionResult> Delete(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var userStory = await _context.UserStories
                .FirstOrDefaultAsync(m => m.UserStoryId == id);
            if (userStory == null)
            {
                return NotFound();
            }

            return View(userStory);
        }

        // POST: UserStory/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> DeleteConfirmed(int id)
        {
            var userStory = await _context.UserStories.FindAsync(id);
            _context.UserStories.Remove(userStory);
            await _context.SaveChangesAsync();
            return RedirectToAction(nameof(Index));
        }

        private bool UserStoryExists(int id)
        {
            return _context.UserStories.Any(e => e.UserStoryId == id);
        }
    }
}
