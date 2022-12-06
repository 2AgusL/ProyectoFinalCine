using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LibreriaCine.Clases
{
    public class Pelicula
    {
        public string Nombre { get; set; }
        public Clasificacion Clasificacion { get; set; }
        public List<Genero> LisGeneros { get; set; }
        public List<Idioma> LisIdiomas { get; set; }
        public int Duracion { get; set; }

        public Pelicula()
        {
            LisGeneros = new List<Genero>();
            LisIdiomas = new List<Idioma>();
        }
        public void AgregarGenero(Genero genero)
        {
            LisGeneros.Add(genero);
        }
        public void QuitarGenero(int indice)
        {
            LisGeneros.RemoveAt(indice);
        }
        public void AgregarIdioma(Idioma idioma)
        {
            LisIdiomas.Add(idioma);
        }
        public void QuitarIdioma(int indice)
        {
            LisIdiomas.RemoveAt(indice);
        }
    }
}
