<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="Producto.aspx.cs" Inherits="EComerce.Admin.Producto" %>



<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script>
        function ImagenVistaPrevia(input) {
            if (input.files && input.files[0]) {
                var reader = new FileReader();
                reader.onload = function (e) {
                    $('#<%= ImagenVistaPrevia.ClientID %>').prop('src', e.target.result)
                        .width(200)
                        .height(200);
                };
                reader.readAsDataURL(input.files[0]);
            }
        }
    </script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="mb-4">
        <asp:Label ID="lblMsg" runat="server" Text="" CssClass="" Visible="false"></asp:Label>
    </div>

    <div class="row">
        <!-- Formulario de Producto -->
        <div class="col-sm-12 col-md-4">
            <div class="card">
                <div class="card-body">
                    <h4 class="card-title">Producto</h4>
                    <hr />
                    <div class="form-body">
                        <label>Nombre Producto</label>
                        <asp:TextBox ID="txtNombreProducto" runat="server" CssClass="form-control" placeholder="Nombre del producto"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvNombreProducto" runat="server" ForeColor="Red" ErrorMessage="El nombre es obligatorio." ControlToValidate="txtNombreProducto" Display="Dynamic"></asp:RequiredFieldValidator>

                        <label>Descripción</label>
                        <asp:TextBox ID="txtDescripcion" runat="server" TextMode="MultiLine" CssClass="form-control" Rows="3" placeholder="Descripción del producto"></asp:TextBox>

                        <label>Precio</label>
                        <asp:TextBox ID="txtPrecio" runat="server" CssClass="form-control" placeholder="Precio"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvPrecio" runat="server" ForeColor="Red" ErrorMessage="El precio es obligatorio." ControlToValidate="txtPrecio" Display="Dynamic"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="revPrecio" runat="server" ForeColor="Red" ErrorMessage="Ingrese un precio válido." ControlToValidate="txtPrecio"
                            ValidationExpression="^\d+(\.\d{1,2})?$" Display="Dynamic"></asp:RegularExpressionValidator>

                        <label>Imagen Producto</label>
                        <asp:FileUpload ID="fuImagenProducto" runat="server" CssClass="form-control" onchange="ImagenVistaPrevia(this);" />

                        <label>Estado</label>
                        <asp:CheckBox ID="cbIsActive" runat="server" Text="Activo" />

                        <asp:HiddenField ID="hfPId" runat="server" Value="0" />
                    </div>

                    <div class="form-action mt-3">
                        <asp:Button ID="btnAgregarActualizar" runat="server" CssClass="btn btn-primary" Text="Guardar" OnClick="btnAgregarActualizar_Click" />
                        <asp:Button ID="btnLimpiar" runat="server" CssClass="btn btn-dark" Text="Reiniciar" OnClick="btnLimpiar_Click" />
                    </div>

                    <div class="mt-3">
                        <asp:Image ID="ImagenVistaPrevia" runat="server" CssClass="img-thumbnail" AlternateText="" />
                    </div>
                </div>
            </div>
        </div>

        <!-- Lista de Productos -->
        <div class="col-sm-12 col-md-8">
            <div class="card">
                <div class="card-body">
                    <h4 class="card-title">Lista de Productos</h4>
                    <hr />
                    <asp:GridView ID="gvProductos" runat="server" AutoGenerateColumns="False" CssClass="table table-bordered" OnRowCommand="gvProductos_RowCommand" OnRowDataBound="gvProductos_RowDataBound">
                        <Columns>
                            <asp:BoundField DataField="PId" HeaderText="ID" Visible="false" />
                            <asp:BoundField DataField="PNombre" HeaderText="Nombre" />
                            <asp:BoundField DataField="PPprecio" HeaderText="Precio" DataFormatString="{0:C}" />
                            <asp:TemplateField HeaderText="Imagen">
                                <ItemTemplate>
                                    <asp:Image ID="imgProducto" runat="server" ImageUrl='<%# Eval("IPUrl") != DBNull.Value ? ResolveUrl("~/" + Eval("IPUrl").ToString()) : ResolveUrl("~/Imagenes/No_image.png") %>' Width="100" Height="100" CssClass="img-thumbnail" />
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="PActivo" HeaderText="Activo" DataFormatString="{0:Yes;No}" />
                            <asp:TemplateField HeaderText="Acciones">
                                <ItemTemplate>
                                    <asp:LinkButton ID="btnEditar" runat="server" CommandName="Edit" CommandArgument='<%# Eval("PId") %>' CssClass="btn btn-sm btn-warning">Editar</asp:LinkButton>
                                    <asp:LinkButton ID="btnEliminar" runat="server" CommandName="Delete" CommandArgument='<%# Eval("PId") %>' CssClass="btn btn-sm btn-danger" OnClientClick="return confirm('¿Está seguro de eliminar este producto?');">Eliminar</asp:LinkButton>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                </div>
            </div>
        </div>
    </div>


</asp:Content>
