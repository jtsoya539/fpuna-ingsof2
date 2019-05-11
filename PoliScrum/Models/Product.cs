using System;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace PoliScrum.Models
{
    [Table("PST_PRODUCT")]
    public class Product
    {
        [Display(Name = "ID", ShortName = "ID")]
        public int Productid { get; set; }
        
        [Display(Name = "ID_PROYECTO", ShortName = "ID")]
        public int ProyectoId { get; set; }
        
        [DataType(DataType.Date)]
        [Display(Name = "Fecha de Creacion", ShortName = "Fecha de Creacion")]
        public DateTime Fecha_Creacion { get; set; }
        
        [Display(Name = "ID_USUARIO", ShortName = "ID")]
        public int Usuarioid { get; set; } 
        
    }
}