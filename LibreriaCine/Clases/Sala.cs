using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LibreriaCine.Clases
{
    public class Sala
    {
        public int Id { get; set; }
        public double Precio { get; set; }
        public List<Butaca> LisButacas { get; set; }
        public int Id_tipo { get; set; }

        public Sala()
        {
            Id = 0;
            Precio = 0;
            LisButacas = new List<Butaca>();
            Id_tipo = 0;
        }
        public Sala(int id, double precio, List<Butaca> Lbutacas)
        {
            Id= id;
            Precio= precio;
            LisButacas= Lbutacas;
        }
    }
}
