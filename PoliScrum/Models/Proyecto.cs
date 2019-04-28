using System;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace PoliScrum.Models
{
    [Table("PST_PROYECTOS")]
    public class Proyecto
    {
        [Display(Name = "ID", ShortName = "ID")]
        public int ProyectoId { get; set; }

        [DataType(DataType.Text)]
        [StringLength(200)]
        [Display(Name = "Nombre", ShortName = "Nombre")]
        public string Nombre { get; set; }

        [Display(Name = "Estado", ShortName = "Estado")]
        public int Estado { get; set; }

        [DataType(DataType.Date)]
        [Display(Name = "Fecha de Inicio", ShortName = "Fecha Inicio")]
        public DateTime FechaInicio { get; set; }

        [DataType(DataType.Date)]
        [Display(Name = "Fecha de Fin", ShortName = "Fecha Fin")]
        public DateTime FechaFin { get; set; }

        [DataType(DataType.Date)]
        [Display(Name = "Fecha de Fin Estimada", ShortName = "Fecha Fin Estimada")]
        public DateTime FechaFinEstimada { get; set; }
    }
}