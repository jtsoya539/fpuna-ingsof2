using System;

namespace PoliScrum.Models
{
    public class HistoriaUsuario 
    {
        public int ID { get; set; }
        public string titulo { get; set; }
        public ProductBacklog IDProductBacklog  { get; set; }
        public string Descripcion { get; set; }
        public  string CriterioAceptacion { get; set; }
        public int Orden { get; set; }
        public int DuracionEstimada { get; set; }
        public int Valor { get; set; }
    }    
}