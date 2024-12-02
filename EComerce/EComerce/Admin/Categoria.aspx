<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="Categoria.aspx.cs" Inherits="EComerce.Admin.Categoria" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <script>
        /* para el mensaje de alerta que desaparece */
        window.onload = function () {
            var seconds = 5;
            setTimeout(function () {
                document.getElementById("<%=lblMsg.ClientID %>").style.display = "none";
            }, seconds * 1000);
        };
    </script>

    <script>
        function ImagenVistaPrevia(input) {
            if (input.files && input.files[0]) {
                var reader = new FileReader();
                reader.onload = function (e) {
                    $('#<%=ImagenVistaPrevia.ClientID%>').prop('src', e.target.result)
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
        <asp:Label ID="lblMsg" runat="server"></asp:Label>
    </div>


    <div class="row">
        <div class="col-sm-12 col-md-4">
            <div class="card">
                <div class="card-body">
                    <h4 class="card-title">Categoria</h4>
                    <hr />

                    <div class="form-body">

                        <label> Nombre Categoria</label>
                        <div class="row">
                            <div class="col-md-12">
                                <div class="form-group">
                                    <asp:TextBox ID="txtNombreCategoria" runat="server" CssClass="form-control" placeholder="Introduzca el nombre de la categoría"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="rfvNombreCategoria" runat="server" ForeColor="Red" Font-Size="Small"
                                        Display="Dynamic" SetFocusOnError="true" ControlToValidate="txtNombreCategoria"
                                        ErrorMessage="Es Requerido el nombre de la categoria" ></asp:RequiredFieldValidator>
                                </div>
                            </div>
                        </div>

                        <label>Imagen Categoria</label>
                        <div class="row">
                            <div class="col-md-12">
                                <div class="form-group">
                                    <asp:FileUpload ID="fuImagenCategoria" runat="server" CssClass="form-control"
                                        onchange ="ImagenVistaPrevia(this);"/>
                                    <asp:HiddenField ID="hfCId" runat="server" Value="0" />
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-md-12">
                                <div class="form-group">
                                    <asp:CheckBox ID="cbIsActive" runat="server" Text="&nbsp; Está activo" />
                                </div>
                            </div>
                        </div>

                    </div>
                    <div class="form-action pb-5">
                        <div class="text-left">
                            <asp:Button ID="btnAgregarOActualizar" runat="server" CssClass="btn btn-info" Text="Agregar" OnClick="btnAgregarOSubir_Click" />
                            <asp:Button ID="btnLimpiar" runat="server" CssClass="btn btn-dark" Text="Reiniciar" OnClick="btnLimpiar_Click" />
                        </div>
                    </div>

                    <div>
                        <asp:Image ID="ImagenVistaPrevia" runat="server" CssClass="img-tumbnail" AlternateText="" />
                    </div>

                </div>
            </div>
        </div>

        <div class="col-sm-12 col-md-8">
            <div class="card">
                <div class="card-body">
                    <h4 class="card-title">Lista Categoria</h4>
                    <hr />
                    <div class="table-responsive">

                        <asp:GridView runat="server" ID="gvCategoria"> </asp:GridView>

                        <asp:Repeater ID="rCategoria" runat="server" OnItemCommand="rCategoria_ItemCommand">
                            <HeaderTemplate>
                                <table class="table data-table-export table-hover nowrap">
                                    <thead>
                                        <tr>
                                            <th class="table-plus">CNombre</th>
                                            <th>CImagen</th>
                                            <th>CEstado</th>
                                            <th>CFCreado</th>
                                            <th class="datatable-nosort">Action</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                
                                        </HeaderTemplate>
                                        <ItemTemplate>
                                            <tr>
                                                <td class="table-plus"> <%# Eval("CNombre") %> </td>
                                                <td > 
                                                    <img width="48" src="<%# EComerce.Utilidades.getImageUrl( Eval("CImagen")) %>" alt="image" />
                                                </td>
                                                <td>
                                                    <asp:Label ID="lblEstado" runat="server" 
                                                        Text ='<%# (bool)Eval("CEstado") == true ? "Activo" : "Inactivo" %>' 
                                                        CssClass='<%# (bool)Eval("CEstado") == true ? "badge badge-success"
                                                            : "badge badge-danger"%>'>

                                                    </asp:Label>
                                                </td>
                                                <td> <%# Eval("CFCreacion") %> </td>
                                                <td>
                                                    <asp:LinkButton ID="lbEditar" Text="Editar" runat="server" CssClass="badge badge-primary"
                                                        CommandArgument='<%# Eval("CId") %>' CommandName="edit" CausesValidation="false">
                                                        <i class="fas fa-edit"></i>
                                                    </asp:LinkButton>
                                                    <asp:LinkButton ID="lbEliminar" Text="Eliminar" runat="server" CssClass="badge badge-danger"
                                                        CommandArgument='<%# Eval("CId") %>' CommandName="delete" CausesValidation="false">>
                                                        <i class="fas fa-trash-alt"></i>
                                                    </asp:LinkButton>
                                                </td>
                                            </tr>
                                        </ItemTemplate>
                                        <FooterTemplate>
                                    </tbody>
                                </table>
                                        </FooterTemplate>
                        </asp:Repeater>

                    </div>

                </div>
            </div>
        </div>

    </div>

</asp:Content>
