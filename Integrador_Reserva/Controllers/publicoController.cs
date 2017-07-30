using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Integrador_Reserva.Controllers
{
    public class publicoController : Controller
    {
        // GET: publico
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult RegistroReserva()
        {
            return View();
        }

        public ActionResult TerminosYCondiciones()
        {
            return View();
        }

        public ActionResult ResultadoBusqueda()
        {
            return View();
        }
    }
}