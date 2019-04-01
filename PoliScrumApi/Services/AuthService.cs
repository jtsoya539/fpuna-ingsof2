using Newtonsoft.Json;
using Oracle4Net;
using PoliScrumApi.Models;

namespace PoliScrumApi.Services
{
    public class AuthService : IAuthService
    {
        private readonly IOracleDatabase database;
        private const string DATA_SOURCE = "(DESCRIPTION=(ADDRESS=(PROTOCOL=TCP)(HOST=JAVIER-HP)(PORT=1521))(CONNECT_DATA=(SERVER=DEDICATED)(SERVICE_NAME=XEPDB1)))";

        private const string API_INICIAR_SESION = "RISK.K_SERVICIO.API_INICIAR_SESION('{0}', '{1}')";
        private const string API_VALIDAR_CREDENCIALES = "RISK.K_SERVICIO.API_VALIDAR_CREDENCIALES('{0}', '{1}')";
        private const string API_FINALIZAR_SESION = "RISK.K_SERVICIO.API_FINALIZAR_SESION({0})";

        public AuthService(IOracleDatabase oracleDatabase)
        {
            database = oracleDatabase;
            database.Connect("risk", "ruffus", DATA_SOURCE);
        }

        public Respuesta apiIniciarSesion(string usuario, string token)
        {
            string stmt = string.Format(API_INICIAR_SESION, new string[] { usuario, token });

            string resp = database.ExecuteStoredFunction<System.String>(stmt);
            Respuesta respuesta = JsonConvert.DeserializeObject<Respuesta>(resp);

            return respuesta;
        }

        public Respuesta apiValidarCredenciales(string usuario, string clave)
        {
            string stmt = string.Format(API_VALIDAR_CREDENCIALES, new string[] { usuario, clave });

            string resp = database.ExecuteStoredFunction<System.String>(stmt);
            Respuesta respuesta = JsonConvert.DeserializeObject<Respuesta>(resp);

            return respuesta;
        }


        public Respuesta apiFinalizarSesion(int idSesion)
        {
            string stmt = string.Format(API_FINALIZAR_SESION, new string[] { idSesion.ToString() });

            string resp = database.ExecuteStoredFunction<System.String>(stmt);
            Respuesta respuesta = JsonConvert.DeserializeObject<Respuesta>(resp);

            return respuesta;
        }
    }
}