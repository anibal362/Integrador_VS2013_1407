using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Integrador_Reserva.Sources.Entities;
using Integrador_Reserva.Sources.DataAccess;

namespace Integrador_Reserva.Sources.Logic
{
    public class UsuarioBusinessLogic
    {
        UsuarioDataAccess usuarioDataAccess = new UsuarioDataAccess();


        public List<Usuario> listaUsuario()
        {
            return usuarioDataAccess.listaUsuario();
        }
        
        public string registrarUsuario(Usuario usuario)
        {
            string msg = String.Empty;

            try
            {
                bool flag = usuarioDataAccess.RegistrarUsuario(usuario);

                msg = flag ? "Se registró correctamente" : "Sucedio un error";
            }
            catch (Exception)
            {
                msg = "Error de logica";
                throw;
            }

            return msg;
        }

        public List<Cancha> ListaCanchasxIdUsuario(int id)
        {
            return usuarioDataAccess.ListaCanchasxIdUsuario(id);
        }

        public string registrarCancha(Cancha cancha)
        {
            string msg = String.Empty;

            try
            {
                bool flag = usuarioDataAccess.registrarCancha(cancha);

                msg = flag ? "Se registró correctamente" : "Sucedio un error";
            }
            catch (Exception)
            {
                msg = "Error de logica";
                throw;
            }

            return msg;
        }

        public List<TipoCancha> listaTipo()
        {
            return usuarioDataAccess.listaTipoCancha();
        }

        public List<Distrito> listaDistrito()
        {
            return usuarioDataAccess.listaDistrito();
        }

        public List<Servicio> listaServicio()
        {
            return usuarioDataAccess.listaServicio();
        }
    }
}