using Integrador_Reserva.Models;
using Integrador_Reserva.Sources.Entities;
using Integrador_Reserva.Sources.Logic;
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

        public ActionResult ResultadoBusqueda(UsuarioCanchaViewModel objUCVM)
        {
            UsuarioBusinessLogic uBL = new UsuarioBusinessLogic();
            UsuarioCanchaViewModel objUsuarioCancha = new UsuarioCanchaViewModel();
            objUsuarioCancha.cancha = new Cancha();
            objUsuarioCancha.cancha.cancha_distrito_id = objUCVM.cancha.cancha_distrito_id;
            if (objUCVM.cancha.cancha_distrito == null)
            {
                objUsuarioCancha.cancha.cancha_distrito = "";
            }
            else
            {
                objUsuarioCancha.cancha.cancha_distrito = objUCVM.cancha.cancha_distrito;
            }
            
            objUsuarioCancha.listaCancha = uBL.ListaCanchasxSearch(objUsuarioCancha.cancha);
            return View(objUsuarioCancha);
        }

        public ActionResult busqueda(UsuarioCanchaViewModel objUCVM)
        {
            return View(objUCVM);
        }

        public ActionResult RegistroCliente()
        {
            return View();
        }

        public ActionResult AñadirCancha()
        {
            UsuarioBusinessLogic usuarioBusinessLogic = new UsuarioBusinessLogic();
            UsuarioCanchaViewModel objUsuarioCancha = new UsuarioCanchaViewModel();
            objUsuarioCancha.usuario = new Usuario();
            objUsuarioCancha.cancha = new Cancha();
            objUsuarioCancha.usuario.usuario_id = 1;
            objUsuarioCancha.usuario.usuario_nombre = "controlador";
            objUsuarioCancha.usuario.usuario_razonsocial = "controlador.SAC";
            objUsuarioCancha.cancha.cancha_usuario_id = 1;
            objUsuarioCancha.listaTipos = usuarioBusinessLogic.listaTipo();
            objUsuarioCancha.listaDistritos = usuarioBusinessLogic.listaDistrito();
            objUsuarioCancha.listaServicios = usuarioBusinessLogic.listaServicio();

            return View(objUsuarioCancha);
        }

        [HttpPost]
        public ActionResult AñadirCancha(UsuarioCanchaViewModel objUCVM)
        {
            return View();
        }
    }
}