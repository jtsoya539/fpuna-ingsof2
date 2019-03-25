using System;
using System.Collections.Generic;
using System.IdentityModel.Tokens.Jwt;
using System.Linq;
using System.Security.Claims;
using System.Text;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.IdentityModel.Tokens;
using PoliScrumApi.Models;
using PoliScrumApi.Services;

namespace PoliScrumApi.Controllers
{
    [Route("poliscrum/api/[controller]")]
    [ApiController]
    public class AuthController : ControllerBase
    {
        private readonly IAuthService service;

        public AuthController(IAuthService authService)
        {
            service = authService;
        }

        // GET api/values
        [HttpGet]
        public ActionResult<IEnumerable<string>> Get()
        {
            return new string[] { "value1", "value2" };
        }

        // GET api/values/5
        [HttpGet("{id}")]
        public ActionResult<string> Get(int id)
        {
            return "value";
        }

        // POST poliscrum/api/auth/token
        [HttpPost("token")]
        public IActionResult validarCredenciales([FromForm] string usuario, [FromForm] string clave)
        {
            Respuesta respuesta = service.apiValidarCredenciales(usuario, clave);
            if (Int32.Parse(respuesta.Codigo) == 0)
            {
                return new ObjectResult(generarToken(usuario));
            }
            return BadRequest();
        }

        // POST poliscrum/api/auth/sesion
        [HttpPost("sesion")]
        public IActionResult iniciarSesion([FromForm] string usuario, [FromForm] string token)
        {
            Respuesta respuesta = service.apiIniciarSesion(usuario, token);
            if (Int32.Parse(respuesta.Codigo) == 0)
            {
                return Ok();
            }
            return BadRequest();
        }

        private object generarToken(string usuario)
        {
            var claims = new Claim[]
            {
                new Claim(ClaimTypes.Name, "javier"),
                new Claim(JwtRegisteredClaimNames.Nbf, new DateTimeOffset(DateTime.Now).ToUnixTimeSeconds().ToString()),
                new Claim(JwtRegisteredClaimNames.Exp, new DateTimeOffset(DateTime.Now.AddDays(1)).ToUnixTimeSeconds().ToString()),
            };

            var token = new JwtSecurityToken(
                new JwtHeader(new SigningCredentials(
                    new SymmetricSecurityKey(Encoding.UTF8.GetBytes("your secret goes here")),
                                             SecurityAlgorithms.HmacSha256)),
                new JwtPayload(claims));

            return new JwtSecurityTokenHandler().WriteToken(token);
        }

    }
}
