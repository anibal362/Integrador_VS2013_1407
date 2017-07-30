using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Integrador_Reserva.Sources.Entities
{
    public class Cancha
    {

        public int cancha_id { get; set; }
        public int cancha_usuario_id { get; set; }
        public string cancha_nombre { get; set; }
        public string cancha_descripcion { get; set; }
        

        public string cancha_tipo { get; set; }
        public string cancha_distrito { get; set; }

        public int cancha_tipo_id { get; set; }
        public int cancha_distrito_id { get; set; }
    }
}