using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using PagedList;

namespace EComerce.Admin
{
    public partial class Producto : System.Web.UI.Page
    {
        SqlConnection con;
        SqlCommand cmd;
        SqlDataAdapter sda;
        DataTable dt;

        protected void Page_Load(object sender, EventArgs e)
        {
            lblMsg.Visible = false;
            if (!IsPostBack)
            {
                getProductos();
            }
        }

        void getProductos()
        {
            using (con = new SqlConnection(Utilidades.getConnection()))
            {
                using (cmd = new SqlCommand("Producto_Crud", con))
                {
                    cmd.Parameters.AddWithValue("@Accion", "GETALL");
                    cmd.CommandType = CommandType.StoredProcedure;
                    sda = new SqlDataAdapter(cmd);
                    dt = new DataTable();
                    sda.Fill(dt);
                    gvProductos.DataSource = dt;
                    gvProductos.DataBind();
                }
            }
        }

        protected void btnAgregarActualizar_Click(object sender, EventArgs e)
        {
            try
            {
                string accion = hfPId.Value == "0" ? "INSERT" : "UPDATE";
                int productoId = string.IsNullOrEmpty(hfPId.Value) ? 0 : Convert.ToInt32(hfPId.Value);

                // Crear conexión y comando SQL
                using (SqlConnection con = new SqlConnection(Utilidades.getConnection()))
                {
                    using (SqlCommand cmd = new SqlCommand("producto_Crud", con))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@Accion", accion);
                        cmd.Parameters.AddWithValue("@PId", productoId);
                        cmd.Parameters.AddWithValue("@PNombre", txtNombreProducto.Text.Trim());
                        cmd.Parameters.AddWithValue("@PDescripcion", txtDescripcion.Text.Trim());
                        cmd.Parameters.AddWithValue("@PPrecio", Convert.ToDecimal(txtPrecio.Text.Trim()));
                        cmd.Parameters.AddWithValue("@PEstado", cbIsActive.Checked);

                        // Asignar valor predeterminado para PFCreacion si es un INSERT
                        if (accion == "INSERT")
                        {
                            cmd.Parameters.AddWithValue("@PFCreacion", DateTime.Now);
                        }

                        // Manejar imagen del producto
                        if (fuImagenProducto.HasFile)
                        {
                            string extension = Path.GetExtension(fuImagenProducto.FileName);
                            string nuevoNombre = Utilidades.getUniqueId() + extension;
                            string ruta = "~/Imagenes/Producto/" + nuevoNombre;

                            // Guardar archivo en el servidor
                            fuImagenProducto.SaveAs(Server.MapPath(ruta));

                            cmd.Parameters.AddWithValue("@PImagen", ruta);
                        }
                        else
                        {
                            cmd.Parameters.AddWithValue("@PImagen", DBNull.Value);
                        }

                        con.Open();
                        cmd.ExecuteNonQuery();

                        lblMsg.Visible = true;
                        lblMsg.Text = accion == "INSERT"
                            ? "Producto agregado exitosamente."
                            : "Producto actualizado exitosamente.";
                        lblMsg.CssClass = "alert alert-success";
                    }
                }

                // Actualizar lista y limpiar formulario
                CargarProductos();
                LimpiarFormulario();
            }
            catch (Exception ex)
            {
                lblMsg.Visible = true;
                lblMsg.Text = "Error: " + ex.Message;
                lblMsg.CssClass = "alert alert-danger";
            }
        }

        protected void btnLimpiar_Click(object sender, EventArgs e)
        {
            clear();
        }

        void clear()
        {
            txtNombreProducto.Text = string.Empty;
            txtDescripcion.Text = string.Empty;
            txtPrecio.Text = string.Empty;
            cbIsActive.Checked = false;
            hfPId.Value = "0";
            ImagenVistaPrevia.ImageUrl = string.Empty;
            btnAgregarActualizar.Text = "Guardar";
        }

        protected void gvProductos_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            lblMsg.Visible = false;
            if (e.CommandName == "Edit")
            {
                int PId = Convert.ToInt32(e.CommandArgument);
                cargarProducto(PId);
            }
            else if (e.CommandName == "Delete")
            {
                int PId = Convert.ToInt32(e.CommandArgument);
                eliminarProducto(PId);
            }
        }

        void cargarProducto(int PId)
        {
            using (con = new SqlConnection(Utilidades.getConnection()))
            {
                using (cmd = new SqlCommand("Producto_Crud", con))
                {
                    cmd.Parameters.AddWithValue("@Accion", "GETBYID");
                    cmd.Parameters.AddWithValue("@Id", PId);
                    cmd.CommandType = CommandType.StoredProcedure;
                    sda = new SqlDataAdapter(cmd);
                    dt = new DataTable();
                    sda.Fill(dt);

                    if (dt.Rows.Count > 0)
                    {
                        txtNombreProducto.Text = dt.Rows[0]["PNombre"].ToString();
                        txtDescripcion.Text = dt.Rows[0]["PDescripcionAdicional"].ToString();
                        txtPrecio.Text = dt.Rows[0]["PPprecio"].ToString();
                        cbIsActive.Checked = Convert.ToBoolean(dt.Rows[0]["PActivo"]);
                        ImagenVistaPrevia.ImageUrl = string.IsNullOrEmpty(dt.Rows[0]["IPUrl"].ToString()) ? "~/Imagenes/No_image.png" : "~/" + dt.Rows[0]["IPUrl"].ToString();
                        ImagenVistaPrevia.Height = 200;
                        ImagenVistaPrevia.Width = 200;
                        hfPId.Value = dt.Rows[0]["PId"].ToString();
                        btnAgregarActualizar.Text = "Actualizar";
                    }
                }
            }
        }

        void eliminarProducto(int PId)
        {
            using (con = new SqlConnection(Utilidades.getConnection()))
            {
                using (cmd = new SqlCommand("Producto_Crud", con))
                {
                    cmd.Parameters.AddWithValue("@Accion", "DELETE");
                    cmd.Parameters.AddWithValue("@Id", PId);
                    cmd.CommandType = CommandType.StoredProcedure;
                    try
                    {
                        con.Open();
                        cmd.ExecuteNonQuery();
                        lblMsg.Visible = true;
                        lblMsg.Text = "Producto eliminado exitosamente.";
                        lblMsg.CssClass = "alert alert-success";
                        getProductos();
                    }
                    catch (Exception ex)
                    {
                        lblMsg.Visible = true;
                        lblMsg.Text = "Error: " + ex.Message;
                        lblMsg.CssClass = "alert alert-danger";
                    }
                    finally
                    {
                        con.Close();
                    }
                }
            }
        }

        string GetImagenUrlById(int PId)
        {
            string url = string.Empty;
            using (con = new SqlConnection(Utilidades.getConnection()))
            {
                using (cmd = new SqlCommand("Producto_Crud", con))
                {
                    cmd.Parameters.AddWithValue("@Accion", "GETBYID");
                    cmd.Parameters.AddWithValue("@Id", PId);
                    cmd.CommandType = CommandType.StoredProcedure;
                    sda = new SqlDataAdapter(cmd);
                    dt = new DataTable();
                    sda.Fill(dt);
                    if (dt.Rows.Count > 0)
                    {
                        url = dt.Rows[0]["IPUrl"].ToString();
                    }
                }
            }
            return url;
        }

        protected void gvProductos_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            // Opcional: Puedes agregar lógica adicional durante el enlace de datos de cada fila
        }
    }
}
