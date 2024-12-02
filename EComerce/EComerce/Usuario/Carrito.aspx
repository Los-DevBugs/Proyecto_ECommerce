<%@ Page Title="" Language="C#" MasterPageFile="~/Usuario/Usuario.Master" AutoEventWireup="true" CodeBehind="Carrito.aspx.cs" Inherits="EComerce.Usuario.Cart" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <!-- Page Header Start -->
    <div class="container-fluid bg-secondary mb-5">
        <div class="d-flex flex-column align-items-center justify-content-center" style="min-height: 300px">
            <h1 class="font-weight-semi-bold text-uppercase mb-3">Carro de la compra</h1>
            <div class="d-inline-flex">
                <p class="m-0"><a href="#">Casa</a></p>
                <p class="m-0 px-2">-</p>
                <p class="m-0">Carro de la compra</p>
            </div>
        </div>
    </div>
    <!-- Page Header End -->

    <!-- Cart Start -->
    <div class="container-fluid pt-5">
        <div class="row px-xl-5">
            <!-- Cart Table -->
            <div class="col-lg-8 table-responsive mb-5">
                <asp:GridView ID="gvCart" runat="server" AutoGenerateColumns="False" CssClass="table table-bordered text-center">
                    <Columns>
                        <asp:TemplateField HeaderText="Productos">
                            <ItemTemplate>
                                <img src='<%# Eval("ImageUrl") %>' alt="Producto" style="width: 50px;" />
                                <%# Eval("ProductName") %>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="Price" HeaderText="Precios" DataFormatString="{0:C}" />
                        <asp:TemplateField HeaderText="Cantidad">
                            <ItemTemplate>
                                <asp:TextBox ID="txtQuantity" runat="server" CssClass="form-control text-center" Text='<%# Eval("Quantity") %>'></asp:TextBox>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="Total" HeaderText="Total" DataFormatString="{0:C}" />
                        <asp:TemplateField HeaderText="Eliminar">
                            <ItemTemplate>
                                <asp:Button ID="btnDelete" runat="server" Text="Eliminar" CssClass="btn btn-primary btn-sm" CommandName="DeleteItem" CommandArgument='<%# Eval("ProductId") %>' />
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            </div>
            <!-- Cart Summary -->
            <div class="col-lg-4">
                <form class="mb-5">
                    <div class="input-group">
                        <asp:TextBox ID="txtCoupon" runat="server" CssClass="form-control p-4" Placeholder="Código de cupón"></asp:TextBox>
                        <div class="input-group-append">
                            <asp:Button ID="btnApplyCoupon" runat="server" CssClass="btn btn-primary" Text="Aplicar cupón" OnClick="btnApplyCoupon_Click" />
                        </div>
                    </div>
                    <!-- Label para mensajes -->
                    <asp:Label ID="lblMsg" runat="server" CssClass="text-success mt-2"></asp:Label>
                </form>
                <div class="card border-secondary mb-5">
                    <div class="card-header bg-secondary border-0">
                        <h4 class="font-weight-semi-bold m-0">Resumen del carrito</h4>
                    </div>
                    <div class="card-body">
                        <div class="d-flex justify-content-between mb-3 pt-1">
                            <h6 class="font-weight-medium">Total Parcial</h6>
                            <asp:Label ID="lblSubtotal" runat="server" CssClass="font-weight-medium">$0.00</asp:Label>
                        </div>
                        <div class="d-flex justify-content-between">
                            <h6 class="font-weight-medium">Envío</h6>
                            <asp:Label ID="lblShipping" runat="server" CssClass="font-weight-medium">$10.00</asp:Label>
                        </div>
                    </div>
                    <div class="card-footer border-secondary bg-transparent">
                        <div class="d-flex justify-content-between mt-2">
                            <h5 class="font-weight-bold">Total</h5>
                            <asp:Label ID="lblTotal" runat="server" CssClass="font-weight-bold">$0.00</asp:Label>
                        </div>
                        <asp:Button ID="btnCheckout" runat="server" CssClass="btn btn-block btn-primary my-3 py-3" Text="Proceder al pago" OnClick="btnCheckout_Click" />
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Cart End -->



</asp:Content>
