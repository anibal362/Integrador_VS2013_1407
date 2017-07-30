using Integrador_Reserva.Sources.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;


namespace Integrador_Reserva.Models
{
    public class UsuarioCanchaViewModel
    {
        public Usuario usuario { get; set; }
        public Cancha cancha { get; set; }
        public List<Cancha> listaCancha { get; set; }
    }
}