using System;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace PoliScrum.Models
{
    [Table("PST_USER_STORIES")]
    public class UserStory
    {
        [Display(Name = "ID", ShortName = "ID")]
        public int UserStoryId { get; set; }

        [DataType(DataType.Text)]
        [StringLength(200)]
        [Display(Name = "Título", ShortName = "Título")]
        public string Titulo { get; set; }

        [DataType(DataType.Text)]
        [StringLength(4000)]
        [Display(Name = "Descripción", ShortName = "Descripción")]
        public string Descripcion { get; set; }

        [DataType(DataType.Text)]
        [StringLength(4000)]
        [Display(Name = "Criterios de Aceptación", ShortName = "Criterios Acept.")]
        public string CriteriosAceptacion { get; set; }

        [Display(Name = "Orden de Prioridad", ShortName = "Prioridad")]
        public int OrdenPrioridad { get; set; }

        [Display(Name = "Duración Estimada", ShortName = "Duración Estimada")]
        public int DuracionEstimada { get; set; }

        [Display(Name = "Valor", ShortName = "Valor")]
        public int Valor { get; set; }

        [DataType(DataType.Date)]
        [Display(Name = "Fecha de Inicio", ShortName = "Fecha Inicio")]
        public DateTime FechaInicio { get; set; }

        [DataType(DataType.Date)]
        [Display(Name = "Fecha de Fin", ShortName = "Fecha Fin")]
        public DateTime FechaFin { get; set; }
    }
}