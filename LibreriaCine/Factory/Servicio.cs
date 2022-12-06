using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using LibreriaCine.Datos;
using LibreriaCine.Clases;

namespace LibreriaCine.Factory
{
	public class Servicio : IServicios
	{
		private IHelperDAO dao;

        public Servicio()
        {
            dao = new HelperDAO();
		}

        public bool AltaComprobante(Comprobante comprobante)
		{
			return dao.AltaComprobante(comprobante);
		}
		public DataTable ObtenerTablasAux(int nroTabla)
		{
			return dao.ObtenerTablasAux(nroTabla);
		}
		public bool AltaFuncion(Funcion funcion)
        {
			return dao.AltaFuncion(funcion);
        }
		public bool AltaPelicula(Pelicula pelicula)
		{
			return dao.AltaPelicula(pelicula);
		}
		public DataTable FiltrarComprobanteDni(int dni)
		{
			return dao.FiltrarComprobanteDni(dni);
		}
		public bool BajaComprobante(int nro_comprobante)
		{
			return dao.BajaComprobante(nro_comprobante);
		}
		public DataTable ObtenerFuncionesEditar()
		{
			return dao.ObtenerFuncionesEditar();
		}
		public bool EditarFuncion(Funcion funcion)
		{
			return dao.EditarFuncion(funcion);
		}
		public int ObtenerIDPXI(int id_pelicula, int id_idioma)
		{
			return dao.ObtenerIDPXI(id_pelicula, id_idioma);
		}
		public int ObtenerUltimoComprobante()
		{
			return dao.ObtenerUltimoComprobante();
		}
		public DataTable ObtenerFuncionesPeliculas()
		{
			return dao.ObtenerFuncionesPeliculas();
		}
		public DataTable ObtenerFuncionesIdiomas(int id_pelicula)
		{
			return dao.ObtenerFuncionesIdiomas(id_pelicula);
		}
		public DataTable ObtenerFuncionesSalas(int id_pelicula, int id_idioma)
		{
			return dao.ObtenerFuncionesSalas(id_pelicula, id_idioma);
		}
		public DataTable ObtenerFuncionesFecha(int id_pelicula, int id_idioma, int id_sala)
		{
			return dao.ObtenerFuncionesFecha(id_pelicula, id_idioma, id_sala);
		}
		public DataTable ObtenerFuncionesHorario(int id_pelicula, int id_idioma, int id_sala, DateTime fecha)
		{
			return dao.ObtenerFuncionesHorario(id_pelicula, id_idioma, id_sala, fecha);
		}
		public int ObtenerFuncionID(int id_pelicula, int id_idioma, int id_sala, int id_horario, DateTime fecha)
		{
			return dao.ObtenerFuncionID(id_pelicula, id_idioma, id_sala, id_horario, fecha);
		}
		public DataTable ObtenerAsientosOcupadosFuncion(int id_funcion)
		{
			return dao.ObtenerAsientosOcupadosFuncion(id_funcion);
		}
		public DataTable ConsultaReporte(string SP)
		{
			return dao.ConsultaReporte(SP);
		}
		public DataTable ObtenerPeliculasActivas()
        {
			return dao.ObtenerPeliculasActivas();
        }
		public DataTable ObtenerIdiomasPeliculas(int id_pelicula)
        {
			return dao.ObtenerIdiomasPeliculas(id_pelicula);
        }
		public DataTable ObtenerSalasDesocupadas(DateTime fecha)
        {
			return dao.ObtenerSalasDesocupadas(fecha);
        }
		public DataTable ObtenerHorariosDisponibles(int nro_sala)
        {
			return dao.ObtenerHorariosDisponibles(nro_sala);
        }
		public DataTable ObtenerFunciones(int eleccion)
        {
			return dao.ObtenerFunciones(eleccion);
        }
		public bool CambiarEstadoFuncion(int id_funcion, int eleccion)
        {
			return dao.CambiarEstadoFuncion(id_funcion, eleccion);
        }
		public DataTable ObtenerPeliculasNombreEstado(string pelicula, int estado)
        {
			return dao.ObtenerPeliculasNombreEstado(pelicula,  estado);
        }
		public bool CambiarEstadoPelicula(int id_pelicula, int eleccion)
        {
			return dao.CambiarEstadoPelicula(id_pelicula, eleccion);
        }
		public Cliente Login(Cliente cliente)
		{
			return dao.Login(cliente);
		}
	}
}
