using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using PoliScrum.Models;

namespace PoliScrum.Controllers
{
    [Authorize]
    public class ProyectoEstadoController : Controller
    {
        private readonly PoliScrumContext _context;

        public ProyectoEstadoController(PoliScrumContext context)
        {
            _context = context;
        }

        // GET: ProyectoEstado
        public async Task<IActionResult> Index()
        {
            return View(await _context.ProyectoEstados.ToListAsync());
        }

        // GET: ProyectoEstado/Details/5
        public async Task<IActionResult> Details(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var proyectoEstado = await _context.ProyectoEstados
                .FirstOrDefaultAsync(m => m.ProyectoEstadoId == id);
            if (proyectoEstado == null)
            {
                return NotFound();
            }

            return View(proyectoEstado);
        }

        // GET: ProyectoEstado/Create
        public IActionResult Create()
        {
            return View();
        }

        // POST: ProyectoEstado/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create([Bind("ProyectoEstadoId,Descripcion")] ProyectoEstado proyectoEstado)
        {
            if (ModelState.IsValid)
            {
                _context.Add(proyectoEstado);
                await _context.SaveChangesAsync();
                return RedirectToAction(nameof(Index));
            }
            return View(proyectoEstado);
        }

        // GET: ProyectoEstado/Edit/5
        public async Task<IActionResult> Edit(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var proyectoEstado = await _context.ProyectoEstados.FindAsync(id);
            if (proyectoEstado == null)
            {
                return NotFound();
            }
            return View(proyectoEstado);
        }

        // POST: ProyectoEstado/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Edit(int id, [Bind("ProyectoEstadoId,Descripcion")] ProyectoEstado proyectoEstado)
        {
            if (id != proyectoEstado.ProyectoEstadoId)
            {
                return NotFound();
            }

            if (ModelState.IsValid)
            {
                try
                {
                    _context.Update(proyectoEstado);
                    await _context.SaveChangesAsync();
                }
                catch (DbUpdateConcurrencyException)
                {
                    if (!ProyectoEstadoExists(proyectoEstado.ProyectoEstadoId))
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
            return View(proyectoEstado);
        }

        // GET: ProyectoEstado/Delete/5
        public async Task<IActionResult> Delete(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var proyectoEstado = await _context.ProyectoEstados
                .FirstOrDefaultAsync(m => m.ProyectoEstadoId == id);
            if (proyectoEstado == null)
            {
                return NotFound();
            }

            return View(proyectoEstado);
        }

        // POST: ProyectoEstado/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> DeleteConfirmed(int id)
        {
            var proyectoEstado = await _context.ProyectoEstados.FindAsync(id);
            _context.ProyectoEstados.Remove(proyectoEstado);
            await _context.SaveChangesAsync();
            return RedirectToAction(nameof(Index));
        }

        private bool ProyectoEstadoExists(int id)
        {
            return _context.ProyectoEstados.Any(e => e.ProyectoEstadoId == id);
        }
    }
}
