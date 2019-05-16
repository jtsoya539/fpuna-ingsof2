using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace PoliScrum.Models
{
    [Table("PST_PROYECTO_ESTADOS")]
    public class ProyectoEstado
    {
        [Display(Name = "ID", ShortName = "ID")]
        public int ProyectoEstadoId { get; set; }

        [DataType(DataType.Text)]
        [StringLength(50)]
        [Display(Name = "Descripción", ShortName = "Descripción")]
        public string Descripcion { get; set; }

        [Display(Name = "Proyectos", ShortName = "Proyectos")]
        public List<Proyecto> Proyectos { get; set; }
    }
}

