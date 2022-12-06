using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using LibreriaCine.Clases;
using System.Data;

namespace LibreriaCine.Datos
{
    internal interface IHelperDAO
    {
        Cliente Login(Cliente cliente);

        bool AltaComprobante(Comprobante comprobante);

        bool AltaPelicula(Pelicula pelicula);

        bool AltaFuncion(Funcion funcion);

        bool BajaComprobante(int nro_comprobante);

        bool CambiarEstadoFuncion(int id_funcion, int eleccion);

        bool CambiarEstadoPelicula(int id_pelicula, int eleccion);

        bool EditarFuncion(Funcion funcion);

        int ObtenerIDPXI(int id_pelicula, int id_idioma);

        DataTable ObtenerFuncionesPeliculas();

        DataTable ObtenerFuncionesIdiomas(int id_pelicula);

        DataTable ObtenerFuncionesSalas(int id_pelicula, int id_idioma);

        DataTable ObtenerFuncionesFecha(int id_pelicula, int id_idioma, int id_sala);

        DataTable ObtenerFuncionesHorario(int id_pelicula, int id_idioma, int id_sala, DateTime fecha);

        int ObtenerFuncionID(int id_pelicula, int id_idioma, int id_sala, int id_horario, DateTime fecha);

        DataTable ObtenerAsientosOcupadosFuncion(int id_funcion);

        DataTable ObtenerFuncionesEditar();

        DataTable FiltrarComprobanteDni(int dni);

        int ObtenerUltimoComprobante();

        DataTable ObtenerTablasAux(int nro);

        DataTable ObtenerPeliculasActivas();

        DataTable ObtenerIdiomasPeliculas(int id_pelicula);

        DataTable ObtenerSalasDesocupadas(DateTime fecha);

        DataTable ObtenerHorariosDisponibles(int nro_sala);

        DataTable ObtenerFunciones(int eleccion);

        DataTable ObtenerPeliculasNombreEstado(string pelicula, int estado);

        DataTable ConsultaReporte(string SP);
    }
}
