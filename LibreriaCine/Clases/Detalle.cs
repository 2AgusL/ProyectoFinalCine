using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LibreriaCine.Clases
{
    public class Detalle
    {

        public Funcion Funcion { get; set; }
        public Sala Sala { get; set; }
        public Detalle()
        {
            Funcion = new Funcion();
            Sala = new Sala();
        }

        public double CalcularTotal()
        {
            double total = Funcion.Sala.Precio * Funcion.Sala.LisButacas.Count;
            return total;
        }
        
    }
}
