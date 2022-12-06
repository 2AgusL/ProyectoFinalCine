using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.Data;
using LibreriaCine.Factory;
using LibreriaCine.Clases;

namespace WebApiAppCine.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class CineController : ControllerBase
    {
        private static IServicios Servicio;

        public CineController()
        {
            Servicio = new Servicio();
        }

        [HttpPost("LoginCliente")]
        public IActionResult GetCliente(Cliente c)
        {
            if (c is not null)
            {
                try
                {
                    return Ok(Servicio.Login(c));
                }
                catch (Exception) { return StatusCode(500, "Error, datos no encontrados"); }

            }else return BadRequest("No se ha cargado correctamente un cliente");
        }

        //HTTP POST
        
        [HttpPost("AltaComprobante")]
        public IActionResult PostComprobante(Comprobante c)
        {
            /*
            Butaca b = new Butaca();
            b.Id = 4;
            b.Estado = 2;
            
            Funcion f = new Funcion();
            f.Id = 1;
            f.Sala.LisButacas.Add(b);

            Detalle dc = new Detalle();
            dc.Sala.Precio = 700;
            dc.Sala.LisButacas.Add(b);
            dc.Funcion = f;

            Comprobante c = new Comprobante();
            c.Id_forma_pago = 1;
            c.Cliente = 3;
            c.Fecha = DateTime.Now;
            c.Id_promo = 1;
            c.LisDetalles.Add(dc);
            */
            try
            {
                if (c == null)
                {
                    return BadRequest("Datos de presupuesto incorrectos!");
                }

                if (Servicio.AltaComprobante(c)) return Ok(true);
                else return BadRequest("No cargaron correctamente los datos");
            }
            catch (Exception)
            {
                return StatusCode(500, "Error interno! Intente luego");
            }
        }


        [HttpPost("AltaPelicula")]
        public IActionResult PostPelicula(Pelicula p)
        {
            try
            {
                if (p == null)
                {
                    return BadRequest(false);
                }

                if (Servicio.AltaPelicula(p)) return Ok(true);
                else return BadRequest(false);
            }
            catch (Exception)
            {
                return StatusCode(500, "Error interno! Intente luego");
            }
        }

        [HttpPost("AltaFuncion")]
        public IActionResult PostFuncion(Funcion f)
        {
            try
            {
                if (f == null)
                {
                    return BadRequest(false);
                }

                if (Servicio.AltaFuncion(f)) return Ok(true);
                else return BadRequest(false);
            }
            catch (Exception)
            {
                return StatusCode(500, "Error interno! Intente luego");
            }
        }



        //HTTP PUT

        [HttpPut("BajaComprobante/{nroComprobante}")]
        public IActionResult DeleteComprobante(int nroComprobante)
        {
            if (nroComprobante == 0) return BadRequest("No ha puesto un Num de comprobante ");

            if (Servicio.BajaComprobante(nroComprobante)) return Ok(true);
            else return BadRequest(false);
        }

        [HttpPut("BajaFuncion/{nroFuncion}/{eleccion}")]
        public IActionResult DeleteFuncion(int nroFuncion, int eleccion)
        {
            if (nroFuncion == 0) return BadRequest("No ha puesto un Num de funcion ");

            if (Servicio.CambiarEstadoFuncion(nroFuncion, eleccion)) return Ok(true);
            else return BadRequest(false);
        }

        [HttpPut("BajaPelicula/{nroPelicula}/{eleccion}")]
        public IActionResult DeletePelicula(int nroPelicula, int eleccion)
        {
            if (nroPelicula == 0) return BadRequest("No ha puesto un Num de funcion ");

            if (Servicio.CambiarEstadoPelicula(nroPelicula, eleccion)) return Ok(true);
            else return BadRequest(false);
        }
    }
}
