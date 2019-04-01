using PoliScrumApi.Models;

namespace PoliScrumApi.Services
{
    public interface IAuthService
    {
        Respuesta apiValidarCredenciales(string usuario, string clave);

        Respuesta apiIniciarSesion(string usuario, string token);

        Respuesta apiFinalizarSesion(int idSesion);
    }
}