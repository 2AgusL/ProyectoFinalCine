using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using LibreriaCine.Clases;
using LibreriaCine.Datos;

namespace LibreriaCine.Factory
{
    public interface IServicios
    {
        bool AltaComprobante(Comprobante comprobante);
        DataTable ObtenerTablasAux(int nroTabla);
        bool AltaPelicula(Pelicula pelicula);
        DataTable FiltrarComprobanteDni(int dni);
        bool BajaComprobante(int nro_comprobante);
        bool AltaFuncion(Funcion funcion);
        DataTable ObtenerFuncionesEditar();
        bool EditarFuncion(Funcion funcion);
        int ObtenerIDPXI(int id_pelicula, int id_idioma);
        int ObtenerUltimoComprobante();
        DataTable ObtenerFuncionesPeliculas();
        DataTable ObtenerFuncionesIdiomas(int id_pelicula);
        DataTable ObtenerFuncionesSalas(int id_pelicula, int id_idioma);
        DataTable ObtenerFuncionesFecha(int id_pelicula, int id_idioma, int id_sala);
        DataTable ObtenerFuncionesHorario(int id_pelicula, int id_idioma, int id_sala, DateTime fecha);
        int ObtenerFuncionID(int id_pelicula, int id_idioma, int id_sala, int id_horario, DateTime fecha);
        DataTable ObtenerAsientosOcupadosFuncion(int id_funcion);
        DataTable ConsultaReporte(string SP);
        DataTable ObtenerFunciones(int eleccion);
        Cliente Login(Cliente cliente);
        bool CambiarEstadoFuncion(int id_funcion, int eleccion);
        bool CambiarEstadoPelicula(int id_pelicula, int eleccion);
    }
}
