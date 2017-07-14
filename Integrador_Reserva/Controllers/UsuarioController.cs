using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Integrador_Reserva.Sources.Logic;
using Integrador_Reserva.Models;
using Integrador_Reserva.Sources.Entities;

namespace Integrador_Reserva.Controllers
{
    public class UsuarioController : Controller
    {
        // GET: Usuario
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult ListaUsuarios()
        {
            UsuarioBusinessLogic uBL = new UsuarioBusinessLogic();
            UsuarioViewModel uVM = new UsuarioViewModel();
            uVM.listaUsuarios = uBL.listaUsuario();
            return View(uVM);
        }

[HttpGet]
        public ActionResult Registrar()
        {
            UsuarioViewModel usuarioViewModel = new UsuarioViewModel();
            usuarioViewModel.usuario = new Usuario();

            return View(usuarioViewModel);
        }

        [HttpPost]
        public ActionResult Registrar(UsuarioViewModel usuarioViewModel)
        {
            string msg = String.Empty;
            if (ModelState.IsValid)
            {
                msg = new UsuarioBusinessLogic().registrarUsuario(usuarioViewModel.usuario);
            }
            return Content(msg);
        }
    }
}