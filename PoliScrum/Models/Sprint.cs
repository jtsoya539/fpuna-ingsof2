using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace PoliScrum.Models
{
    [Table("PST_SPRINTS")]
    public class Sprint
    {
        [Display(Name = "ID", ShortName = "ID")]
        public int SprintId { get; set; }

        [DataType(DataType.Date)]
        [Display(Name = "Fecha de Inicio", ShortName = "Fecha Inicio")]
        public DateTime FechaInicio { get; set; }

        [DataType(DataType.Date)]
        [Display(Name = "Fecha de Fin Estimada", ShortName = "Fecha Fin Estimada")]
        public DateTime FechaFinEstimada { get; set; }

        [Display(Name = "Duración Estimada", ShortName = "Duración Estimada")]
        public int DuracionEstimada { get; set; }

        [DataType(DataType.Date)]
        [Display(Name = "Fecha de Fin", ShortName = "Fecha Fin")]
        public DateTime FechaFin { get; set; }

        [Display(Name = "Proyecto", ShortName = "Proyecto")]
        public Proyecto Proyecto { get; set; }

        [Display(Name = "Sprint Backlog", ShortName = "Sprint Backlog")]
        public List<UserStory> SprintBacklog { get; set; }
    }
}