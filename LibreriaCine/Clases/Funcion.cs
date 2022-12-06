using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LibreriaCine.Clases
{
    public class Funcion
    {
        public int Id { get; set; }
        public int Id_peli_idio { get; set; }
        public Pelicula Pelicula { get; set; }
        public Sala Sala { get; set; }
        public DateTime Fecha { get; set; }
        public Horario Horario { get; set; }
        public Idioma Idioma { get; set; } //nuevo DUDOSO

        //public string Mostrar()
        //{
        //    return Pelicula.Nombre + " - " + idioma.Nombre + " - " + Horario.Hora + " - " + Sala.Tipo;
        //}
        public Funcion()
        {
            Id = 0;
            Id_peli_idio = 0;
            Pelicula = new Pelicula();
            Sala = new Sala();
            Fecha = DateTime.Now;
            Horario = new Horario();
            Idioma = new Idioma();
        }
        public Funcion(int id, Pelicula peli, Sala sala, DateTime fecha, Horario hora, Idioma idio)
        {
            Id = id;
            //Id_peli_idio = id_p_i;
            Pelicula = peli;
            Sala = sala;
            Fecha = fecha;
            Horario = hora;
            Idioma = idio;
        }
        public Funcion(int id, Pelicula peli, Sala sala)
        {
            Id = id;
            Pelicula = peli;
            Sala = sala;
        }

    }
}
