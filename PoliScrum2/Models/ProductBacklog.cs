using System;

namespace PoliScrum.Models
{
    public class ProductBacklog 
    {
        public int ID { get; set; }
        public DateTime FechaCreacion { get; set; }
        public Proyecto IDProyecto { get; set; }
         public Usuario IDUsuarioResponsable { get; set; }
    
    }    
}