using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LibreriaCine.Clases
{
    public class Cliente
    {
        public int Id { get; set; }
        public string Nombre { get; set; }
        public string Apellido { get; set; }
        public string Dni { get; set; }
        public string Password { get; set; }
        public int Puntos { get; set; }

        public Cliente(int id = 0, string nombre = "", string apellido = "", string dni = "", string password = "", int puntos = 0)
        {
            Id = id;
            Nombre = nombre;
            Apellido = apellido;
            Dni = dni;
            Password = password;
            Puntos = puntos;
        }

        public Cliente()
        {
            Id = 0;
            Nombre = "";
            Apellido = "";
            Dni = "";
            Password = "";
            Puntos = 0;
        }

    }
}
