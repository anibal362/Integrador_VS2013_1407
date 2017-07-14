using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Integrador_Reserva.Sources.Connection
{
    public static class Constante
    {
        public const string USP_SEL_LISTAUSUARIO = "selectAllUsuario";
        public const string USP_INS_USUARIO = "insertUsuario";
        public const string USP_UPD_USUARIO = "updateUsuario";
        public const string CON_DATABASE = "Data Source = THINK362-PC\\SQLEXPRESS; Initial Catalog = reserva; User ID = sa; Password = 3545409";
        public const string CON_DATABASE2 = "Data Source = UTP061509; Initial Catalog = reserva; User ID = sa; Password = alumno";

    }
}