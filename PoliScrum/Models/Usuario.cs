using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace PoliScrum.Models
{
    [Table("PST_USUARIOS")]
    public class Usuario
    {
        [Display(Name = "ID", ShortName = "ID")]
        public int UsuarioId { get; set; }

        [DataType(DataType.Text)]
        [StringLength(50)]
        [Display(Name = "Nombre", ShortName = "Nombre")]
        public string Nombre { get; set; }

        [DataType(DataType.Text)]
        [StringLength(50)]
        [Display(Name = "Apellido", ShortName = "Apellido")]
        public string Apellido { get; set; }

        [DataType(DataType.Text)]
        [StringLength(30)]
        [Display(Name = "Cédula", ShortName = "Cédula")]
        public string Cedula { get; set; }

        [DataType(DataType.Text)]
        [StringLength(100)]
        [Display(Name = "Correo Electrónico", ShortName = "Correo Electrónico")]
        public string CorreoElectronico { get; set; }

        [Display(Name = "Rol", ShortName = "Rol")]
        public Rol Rol { get; set; }
    }
}