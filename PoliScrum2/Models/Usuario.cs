using System;
using System.ComponentModel.DataAnnotations;

namespace PoliScrum.Models
{
    public class Usuario
    {
        public int ID { get; set; }

        [DataType(DataType.Text)]
        [MaxLength(100)]
        public string Nombre { get; set; }

        [DataType(DataType.Text)]
        [MaxLength(100)]
        public string Apellido { get; set; }

        [DataType(DataType.Text)]
        [MaxLength(30)]
        public string Cedula { get; set; }

        [DataType(DataType.Date)]
        public DateTime FechaNacimiento { get; set; }

        [DataType(DataType.EmailAddress)]
        [MaxLength(100)]
        public string CorreoElectronico { get; set; }

        [DataType(DataType.Password)]
        [MaxLength(100)]
        public string Contrasena { get; set; }
    }
}