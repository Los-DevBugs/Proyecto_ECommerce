using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Security.Cryptography;
using System.Web;
using System.Web.ModelBinding;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EComerce.Admin
{
    public partial class Categoria : System.Web.UI.Page
    {
        SqlConnection con;
        SqlCommand cmd;
        SqlDataAdapter sda;
        DataTable dt;

        protected void Page_Load(object sender, EventArgs e)
        {
            Session["breadCumbTitle"] = "Manage Category";
            Session["breadCumbPage"] = "Manage Category";
            lblMsg.Visible = false;
            getCategorias();

            using (BDEComerceEntities1 ventas = new BDEComerceEntities1())
            {
                //Consulta LINQ to Entities
                var consulta = from C in ventas.TCategoria
                               select C;
                gvCategoria.DataSource = consulta.ToList();
                gvCategoria.DataBind();
            }
        }

        void getCategorias()
        {
            con = new SqlConnection(Utilidades.getConnection());
            cmd = new SqlCommand("categoria_Crud", con);
            cmd.Parameters.AddWithValue("@Accion", "GETALL");
            cmd.CommandType = CommandType.StoredProcedure;
            sda = new SqlDataAdapter(cmd);
            dt = new DataTable();
            sda.Fill(dt);
            rCategoria.DataSource = dt;
            rCategoria.DataBind();
        }
        protected void btnAgregarOSubir_Click(object sender, EventArgs e)
        {
            string NombreAccion = string.Empty, RutaImagen = string.Empty, ExtensionArchivo = string.Empty;
            bool ValidarEjecutar = false;
            int CId = Convert.ToInt32(hfCId.Value);
            con = new SqlConnection(Utilidades.getConnection());
            cmd = new SqlCommand("categoria_Crud", con);
            cmd.Parameters.AddWithValue("@Accion", CId == 0 ? "INSERT" : "UPDATE");
            cmd.Parameters.AddWithValue("@CId", CId);
            cmd.Parameters.AddWithValue("@CNombre", txtNombreCategoria.Text.Trim());
            cmd.Parameters.AddWithValue("@CEstado", cbIsActive.Checked);
            if(fuImagenCategoria.HasFile)
            {
                if(Utilidades.isValidExtencion(fuImagenCategoria.FileName))
                {
                    string NuevoNombreImagen = Utilidades.getUniqueId();
                    ExtensionArchivo = Path.GetExtension(fuImagenCategoria.FileName);
                    RutaImagen = "Imagenes/Categoria/" + NuevoNombreImagen.ToString() + ExtensionArchivo;
                    fuImagenCategoria.PostedFile.SaveAs(Server.MapPath("~/Imagenes/Categoria/") + NuevoNombreImagen.ToString() + ExtensionArchivo);
                    cmd.Parameters.AddWithValue("@CImagen", RutaImagen);
                    ValidarEjecutar = true;
                }
                else
                {
                    lblMsg.Visible = false;
                    lblMsg.Text = "Por favor seleccione una imagen en .jpg, .jpeg o png";
                    lblMsg.CssClass = "alert alert-danger";
                    ValidarEjecutar = false;
                }
            }
            else
            {
                ValidarEjecutar = true;
            }

            if(ValidarEjecutar)
            {
                cmd.CommandType = CommandType.StoredProcedure;
                try
                {
                    con.Open();
                    cmd.ExecuteNonQuery();
                    NombreAccion = CId == 0 ? "inserted" : "updated";
                    lblMsg.Visible = true;
                    lblMsg.Text = "Categoria " + NombreAccion + " exitosamente:";
                    lblMsg.CssClass = "alert alert-success";
                    getCategorias();
                    clear();
                }
                catch(Exception ex)
                { 
                    lblMsg.Visible = true;
                    lblMsg.Text = "Error- " + ex.Message;
                    lblMsg.CssClass = "alert alert-danger";
                }
                finally
                {
                    con.Close();
                }

            }
        }
        protected void btnLimpiar_Click(object sender, EventArgs e)
        {
            clear();
        }

        void clear()
        {
            txtNombreCategoria.Text = string.Empty;
            cbIsActive.Checked = false;
            hfCId.Value = "0";
            ImagenVistaPrevia.ImageUrl = string.Empty;
        }

        protected void rCategoria_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            lblMsg.Visible = false;
            if(e.CommandName == "edit")
            {
                con = new SqlConnection(Utilidades.getConnection());
                cmd = new SqlCommand("categoria_Crud", con);
                cmd.Parameters.AddWithValue("@Accion", "GETBYID");
                cmd.Parameters.AddWithValue("@CId", e.CommandArgument);
                cmd.CommandType = CommandType.StoredProcedure;
                sda = new SqlDataAdapter(cmd);
                dt = new DataTable();
                sda.Fill(dt);
                txtNombreCategoria.Text = dt.Rows[0]["CNombre"].ToString();
                cbIsActive.Checked = Convert.ToBoolean(dt.Rows[0]["CEstado"]);
                ImagenVistaPrevia.ImageUrl = string.IsNullOrEmpty(dt.Rows[0]["CImagen"].ToString()) ? "../Imagenes/No_image.png" : "../" + dt.Rows[0]["CImagen"].ToString();
                ImagenVistaPrevia.Height = 200;
                ImagenVistaPrevia.Width = 200;
                hfCId.Value = dt.Rows[0]["CId"].ToString();
                btnAgregarOActualizar.Text = "Update";
            }
            else if (e.CommandName == "delete")
            {
                con = new SqlConnection(Utilidades.getConnection());
                cmd = new SqlCommand("categoria_Crud", con);
                cmd.Parameters.AddWithValue("@Accion", "DELETE");
                cmd.Parameters.AddWithValue("@CId", e.CommandArgument);
                cmd.CommandType = CommandType.StoredProcedure;
                try
                {
                    con.Open();
                    cmd.ExecuteNonQuery();
                    lblMsg.Visible = true;
                    lblMsg.Text = "Categoria eliminada exitosamente:";
                    lblMsg.CssClass = "alert alert-success";
                    getCategorias();
                }
                catch (Exception ex)
                {
                    lblMsg.Visible = true;
                    lblMsg.Text = "Error- " + ex.Message;
                    lblMsg.CssClass = "alert alert-danger";
                }
                finally
                {
                    con.Close();
                }
            }
        }
    }
}