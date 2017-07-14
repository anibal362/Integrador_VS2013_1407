using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Integrador_Reserva.Sources.Entities;
using System.Data.SqlClient;
using System.Data;
using Integrador_Reserva.Sources.Connection;

namespace Integrador_Reserva.Sources.DataAccess
{
    public class UsuarioDataAccess
    {

        private Conexion conexion;
        private SqlCommand command;

        public UsuarioDataAccess()
        {
            conexion = new Conexion();
        }

        public List<Usuario> listaUsuario()
        {
            List<Usuario> lista = new List<Usuario>();
            Usuario usuario;
            conexion.iniciarConexion();
            command = new SqlCommand("selectAllUsuario", conexion.getCon());
            // DbCommand cmd = dataBase.GetStoredProcCommand(Procedimiento.USP_SEL_LISTAUSUARIO);
            command.CommandType = CommandType.StoredProcedure;

            using (IDataReader iDataReader = command.ExecuteReader())
            {
                int iUsuario_id = iDataReader.GetOrdinal("usuario_id");
                int iUsuario_nombre = iDataReader.GetOrdinal("usuario_nombre");
                int iUsuario_contraseña = iDataReader.GetOrdinal("usuario_contraseña");
                int iUsuario_razonsocial = iDataReader.GetOrdinal("usuario_razonsocial");
                int iUsuario_ruc = iDataReader.GetOrdinal("usuario_ruc");
                int iUsuario_email = iDataReader.GetOrdinal("usuario_email");
                int iUsuario_telefono = iDataReader.GetOrdinal("usuario_telefono");
                int iUsuario_foto_url = iDataReader.GetOrdinal("usuario_foto_url");
                int iUsuario_presentacion = iDataReader.GetOrdinal("usuario_presentacion");
                int iactivo = iDataReader.GetOrdinal("activo");
                int iUsuario_creacion = iDataReader.GetOrdinal("usuario_creacion");
                int iUsuario_modificacion = iDataReader.GetOrdinal("usuario_modificacion");
                int ifecha_creacion = iDataReader.GetOrdinal("fecha_creacion");
                int ifecha_modificacion = iDataReader.GetOrdinal("fecha_modificacion");

                while (iDataReader.Read())
                {
                    usuario = new Usuario();
                    usuario.usuario_id = DataUtil.DbValueToDefault<Int32>(iDataReader[iUsuario_id]);
                    usuario.usuario_nombre = DataUtil.DbValueToDefault<string>(iDataReader[iUsuario_nombre]);
                    usuario.usuario_contraseña = DataUtil.DbValueToDefault<string>(iDataReader[iUsuario_contraseña]);
                    usuario.usuario_razonsocial = DataUtil.DbValueToDefault<string>(iDataReader[iUsuario_razonsocial]);
                    usuario.usuario_ruc = DataUtil.DbValueToDefault<string>(iDataReader[iUsuario_ruc]);
                    usuario.usuario_email = DataUtil.DbValueToDefault<string>(iDataReader[iUsuario_email]);
                    usuario.usuario_telefono = DataUtil.DbValueToDefault<string>(iDataReader[iUsuario_telefono]);
                    usuario.usuario_foto_url = DataUtil.DbValueToDefault<string>(iDataReader[iUsuario_foto_url]);
                    usuario.usuario_presentacion = DataUtil.DbValueToDefault<string>(iDataReader[iUsuario_presentacion]);
                    usuario.activo = DataUtil.DbValueToDefault<Boolean>(iDataReader[iactivo]);
                    usuario.usuario_creacion = DataUtil.DbValueToDefault<string>(iDataReader[iUsuario_creacion]);
                    usuario.usuario_modificacion = DataUtil.DbValueToDefault<string>(iDataReader[iUsuario_modificacion]);
                    usuario.fecha_creacion = DataUtil.DbValueToDefault<DateTime>(iDataReader[ifecha_creacion]);
                    usuario.fecha_modificacion = DataUtil.DbValueToDefault<DateTime>(iDataReader[ifecha_modificacion]);
                    lista.Add(usuario);
                }
            }
            conexion.cerrarConexion();
            return lista;
        }

        public bool RegistrarUsuario(Usuario usuario)
        {
            conexion.iniciarConexion();

             command = new SqlCommand(Constante.USP_INS_USUARIO, conexion.getCon());
             command.CommandType = CommandType.StoredProcedure;


            SqlParameter pUsuario_id = new SqlParameter();

            command.Parameters.Add("@usuario_id",SqlDbType.Int);
            command.Parameters.Add("@usuario_nombre", SqlDbType.VarChar);
            command.Parameters.Add("@usuario_contraseña", SqlDbType.VarChar);
            command.Parameters.Add("@usuario_razonsocial", SqlDbType.VarChar);
            command.Parameters.Add("@usuario_ruc", SqlDbType.VarChar);
            command.Parameters.Add("@usuario_email", SqlDbType.VarChar);
            command.Parameters.Add("@usuario_telefono", SqlDbType.VarChar);
            command.Parameters.Add("@usuario_foto_url", SqlDbType.VarChar);
            command.Parameters.Add("@usuario_presentacion", SqlDbType.VarChar);
            command.Parameters.Add("@activo", SqlDbType.Binary);
            command.Parameters.Add("@usuario_creacion", SqlDbType.VarChar);
            command.Parameters.Add("@usuario_modificacion", SqlDbType.VarChar);
            command.Parameters.Add("@fecha_creacion", SqlDbType.DateTime );
            command.Parameters.Add("@fecha_modificacion", SqlDbType.DateTime);

            command.Parameters["@usuario_id"].Value = usuario.usuario_id;
            command.Parameters["@usuario_nombre"].Value = usuario.usuario_nombre;
            command.Parameters["@usuario_contraseña"].Value = usuario.usuario_contraseña;
            command.Parameters["@usuario_razonsocial"].Value = usuario.usuario_razonsocial;
            command.Parameters["@usuario_ruc"].Value = usuario.usuario_ruc;
            command.Parameters["@usuario_email"].Value = usuario.usuario_email;
            command.Parameters["@usuario_telefono"].Value = usuario.usuario_telefono;
            command.Parameters["@usuario_foto_url"].Value = usuario.usuario_foto_url;
            command.Parameters["@usuario_presentacion"].Value = usuario.usuario_presentacion;
            command.Parameters["@activo"].Value = usuario.activo;
            command.Parameters["@usuario_creacion"].Value = usuario.usuario_creacion;
            command.Parameters["@usuario_modificacion"].Value = usuario.usuario_modificacion;
            command.Parameters["@fecha_creacion"].Value = usuario.fecha_creacion;
            command.Parameters["@fecha_modificacion"].Value = usuario.fecha_modificacion;
           
           //  dataBase.AddInParameter(dbCommand, "@fecha_modificacion", DbType.DateTime , usuario.fecha_modificacion);

             var resultado = command.ExecuteNonQuery();

            conexion.cerrarConexion();

            return resultado == null ? false : true;
        }
    }
}