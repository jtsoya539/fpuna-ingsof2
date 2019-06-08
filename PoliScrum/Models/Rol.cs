using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace PoliScrum.Models
{
    [Table("PST_ROLES")]
    public class Rol
    {
        [Display(Name = "ID", ShortName = "ID")]
        public int RolId { get; set; }

        [DataType(DataType.Text)]
        [StringLength(100)]
        [Display(Name = "Descripción", ShortName = "Descripción")]
        public string Descripcion { get; set; }

        [Display(Name = "Usuarios", ShortName = "Usuarios")]
        public List<Usuario> Usuarios { get; set; }
    }
}