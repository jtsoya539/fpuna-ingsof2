using System;

namespace PoliScrum.Models
{
    public class Proyecto
    {
        public int ID { get; set; }
        public string Nombre { get; set; }
        public EstadoProyecto Estado { get; set; }
        public DateTime FechaInicio { get; set; }
        public DateTime FechaFinEstimado { get; set; }
        public DateTime FechaFin { get; set; }
    }    
}