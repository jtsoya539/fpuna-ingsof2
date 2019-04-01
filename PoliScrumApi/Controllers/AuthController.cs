using System;
using System.Collections.Generic;
using System.IdentityModel.Tokens.Jwt;
using System.Linq;
using System.Security.Claims;
using System.Text;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Authorization;
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

        // GET poliscrum/api/auth/version
        [HttpGet("version")]
        [Authorize]
        public ActionResult<string> Get()
        {
            return "0.1";
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
        public IActionResult iniciarSesion(string usuario, string token)
        {
            Respuesta respuesta = service.apiIniciarSesion(usuario, token);
            return Ok(respuesta);
        }

        // DELETE poliscrum/api/auth/sesion
        [HttpDelete("sesion")]
        public IActionResult finalizarSesion(int idSesion)
        {
            Respuesta respuesta = service.apiFinalizarSesion(idSesion);
            return Ok(respuesta);
        }

        private object generarToken(string usuario)
        {
            var claims = new Claim[]
            {
                new Claim(ClaimTypes.Name, usuario),
                new Claim(JwtRegisteredClaimNames.Iat, new DateTimeOffset(DateTime.Now).ToUnixTimeSeconds().ToString()),
                new Claim(JwtRegisteredClaimNames.Nbf, new DateTimeOffset(DateTime.Now).ToUnixTimeSeconds().ToString()),
                new Claim(JwtRegisteredClaimNames.Exp, new DateTimeOffset(DateTime.Now.AddMinutes(10)).ToUnixTimeSeconds().ToString()),
            };

            var token = new JwtSecurityToken(
                new JwtHeader(new SigningCredentials(
                    new SymmetricSecurityKey(Encoding.UTF8.GetBytes("6pCgPdzWUEvSKRKNYJgVh9GjveXTAEDA1fXjfgFQ4x8JuYmvILBVlDSePJ5SIlp")),
                                             SecurityAlgorithms.HmacSha256)),
                new JwtPayload(claims));

            return new JwtSecurityTokenHandler().WriteToken(token);
        }

    }
}
