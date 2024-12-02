<%@ Page Title="" Language="C#" MasterPageFile="~/Usuario/Usuario.Master" AutoEventWireup="true" CodeBehind="Tienda.aspx.cs" Inherits="EComerce.Usuario.Tienda" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <!-- Page Header Start -->
    <div class="container-fluid bg-secondary mb-5">
        <div class="d-flex flex-column align-items-center justify-content-center" style="min-height: 300px">
            <h1 class="font-weight-semi-bold text-uppercase mb-3">Nuestra tienda</h1>
            <div class="d-inline-flex">
                <p class="m-0"><a href="#">Hogar</a></p>
                <p class="m-0 px-2">-</p>
                <p class="m-0">Tienda</p>
            </div>
        </div>
    </div>

    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" rel="stylesheet">
    <style>
        .container {
            max-width: 1200px;
            margin: 20px auto;
            display: flex;
            flex-wrap: wrap;
            gap: 20px;
        }
        .product-item {
            width: 300px;
            border: 1px solid #ddd;
            border-radius: 10px;
            overflow: hidden;
            background-color: #fff;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }
        .product-item img {
            width: 100%;
            height: 200px;
            object-fit: cover;
        }
        .product-item h6 {
            font-size: 16px;
            margin: 10px 0;
        }
        .product-item .price {
            font-weight: bold;
            color: #333;
        }
        .product-item .actions {
            display: flex;
            justify-content: space-between;
            padding: 10px;
            background-color: #f9f9f9;
            border-top: 1px solid #ddd;
        }
        .product-item .actions a {
            text-decoration: none;
            font-size: 14px;
            color: #007bff;
            cursor: pointer;
        }
        .product-item .actions a:hover {
            color: #0056b3;
        }
    </style>
    <!-- Page Header End -->

    <!-- Shop Start -->
    <div class="container-fluid pt-5">
        <div class="row px-xl-5">
            <!-- Shop Sidebar Start -->
            <div class="col-lg-3 col-md-12">
                <!-- Price Start -->
                <div class="border-bottom mb-4 pb-4">
                    <h5 class="font-weight-semi-bold mb-4">Filtrar por precio</h5>
                    
                        <div class="custom-control custom-checkbox d-flex align-items-center justify-content-between mb-3">
                            <asp:CheckBox ID="Checkbox1" runat="server" CssClass="custom-control-input" Checked="true" />
                            <label class="custom-control-label" for="price-all">Todos los Precios</label>
                            <span class="badge border font-weight-normal">1000</span>
                        </div>
                        <div class="custom-control custom-checkbox d-flex align-items-center justify-content-between mb-3">
                            <asp:CheckBox ID="Checkbox2" runat="server" CssClass="custom-control-input" />
                            <label class="custom-control-label" for="price-1">$0 - $100</label>
                            <span class="badge border font-weight-normal">150</span>
                        </div>
                        <div class="custom-control custom-checkbox d-flex align-items-center justify-content-between mb-3">
                            <asp:CheckBox ID="Checkbox3" runat="server" CssClass="custom-control-input" />
                            <label class="custom-control-label" for="price-2">$100 - $200</label>
                            <span class="badge border font-weight-normal">295</span>
                        </div>
                        <div class="custom-control custom-checkbox d-flex align-items-center justify-content-between mb-3">
                            <asp:CheckBox ID="Checkbox4" runat="server" CssClass="custom-control-input" />
                            <label class="custom-control-label" for="price-3">$200 - $300</label>
                            <span class="badge border font-weight-normal">246</span>
                        </div>
                        <div class="custom-control custom-checkbox d-flex align-items-center justify-content-between mb-3">
                            <asp:CheckBox ID="Checkbox5" runat="server" CssClass="custom-control-input" />
                            <label class="custom-control-label" for="price-4">$300 - $400</label>
                            <span class="badge border font-weight-normal">145</span>
                        </div>
                        <div class="custom-control custom-checkbox d-flex align-items-center justify-content-between">
                            <asp:CheckBox ID="Checkbox6" runat="server" CssClass="custom-control-input" />
                            <label class="custom-control-label" for="price-5">$400 - $500</label>
                            <span class="badge border font-weight-normal">168</span>
                        </div>
                    </form>
                </div>
                <!-- Price End -->
                
                <!-- Color Start -->
                <div class="border-bottom mb-4 pb-4">
                    <h5 class="font-weight-semi-bold mb-4">Filtrar por color</h5>
                    
                        <div class="custom-control custom-checkbox d-flex align-items-center justify-content-between mb-3">
                            <asp:CheckBox ID="Checkbox7" runat="server" CssClass="custom-control-input" Checked="true" />
                            <label class="custom-control-label" for="color-all">Todos los Colores</label>
                            <span class="badge border font-weight-normal">1000</span>
                        </div>
                        <div class="custom-control custom-checkbox d-flex align-items-center justify-content-between mb-3">
                            <asp:CheckBox ID="Checkbox8" runat="server" CssClass="custom-control-input" />
                            <label class="custom-control-label" for="color-1">Negro</label>
                            <span class="badge border font-weight-normal">150</span>
                        </div>
                        <div class="custom-control custom-checkbox d-flex align-items-center justify-content-between mb-3">
                            <asp:CheckBox ID="Checkbox9" runat="server" CssClass="custom-control-input" />
                            <label class="custom-control-label" for="color-2">Blanco</label>
                            <span class="badge border font-weight-normal">295</span>
                        </div>
                        <div class="custom-control custom-checkbox d-flex align-items-center justify-content-between mb-3">
                            <asp:CheckBox ID="Checkbox10" runat="server" CssClass="custom-control-input" />
                            <label class="custom-control-label" for="color-3">Rojo</label>
                            <span class="badge border font-weight-normal">246</span>
                        </div>
                        <div class="custom-control custom-checkbox d-flex align-items-center justify-content-between mb-3">
                            <asp:CheckBox ID="Checkbox11" runat="server" CssClass="custom-control-input" />
                            <label class="custom-control-label" for="color-4">Azul</label>
                            <span class="badge border font-weight-normal">145</span>
                        </div>
                        <div class="custom-control custom-checkbox d-flex align-items-center justify-content-between">
                            <asp:CheckBox ID="Checkbox12" runat="server" CssClass="custom-control-input" />
                            <label class="custom-control-label" for="color-5">Verde</label>
                            <span class="badge border font-weight-normal">168</span>
                        </div>
                    </form>
                </div>
                <!-- Color End -->

                <!-- Size Start -->
                <div class="mb-5">
                    <h5 class="font-weight-semi-bold mb-4">Filtrar por tamaño</h5>
                    
                        <div class="custom-control custom-checkbox d-flex align-items-center justify-content-between mb-3">
                            <asp:CheckBox ID="Checkbox13" runat="server" CssClass="custom-control-input" Checked="true" />
                            <label class="custom-control-label" for="size-all">Todos los Tamaños</label>
                            <span class="badge border font-weight-normal">1000</span>
                        </div>
                        <div class="custom-control custom-checkbox d-flex align-items-center justify-content-between mb-3">
                            <asp:CheckBox ID="Checkbox14" runat="server" CssClass="custom-control-input" />
                            <label class="custom-control-label" for="size-1">XS</label>
                            <span class="badge border font-weight-normal">150</span>
                        </div>
                        <div class="custom-control custom-checkbox d-flex align-items-center justify-content-between mb-3">
                            <asp:CheckBox ID="Checkbox15" runat="server" CssClass="custom-control-input" />
                            <label class="custom-control-label" for="size-2">S</label>
                            <span class="badge border font-weight-normal">295</span>
                        </div>
                        <div class="custom-control custom-checkbox d-flex align-items-center justify-content-between mb-3">
                            <asp:CheckBox ID="Checkbox16" runat="server" CssClass="custom-control-input" />
                            <label class="custom-control-label" for="size-3">M</label>
                            <span class="badge border font-weight-normal">246</span>
                        </div>
                        <div class="custom-control custom-checkbox d-flex align-items-center justify-content-between mb-3">
                            <asp:CheckBox ID="Checkbox17" runat="server" CssClass="custom-control-input" />
                            <label class="custom-control-label" for="size-4">L</label>
                            <span class="badge border font-weight-normal">145</span>
                        </div>
                        <div class="custom-control custom-checkbox d-flex align-items-center justify-content-between">
                            <asp:CheckBox ID="Checkbox18" runat="server" CssClass="custom-control-input" />
                            <label class="custom-control-label" for="size-5">XL</label>
                            <span class="badge border font-weight-normal">168</span>
                        </div>
                    </form>
                </div>
                <!-- Size End -->
            </div>
            <!-- Shop Sidebar End -->

            <!-- inicio CATÁLOGO PRODUCTOS -->

            <div class="container">
                <h2>Products</h2>
                <% foreach (var product in Products) { %>
                    <div class="product">
                        <img src="<%= EComerce.Utilidades.getImageUrl(product.IPUrl) %>" alt="Product Image" />
                        <h4><%= product.PNombre %></h4>
                        <p>Price: $<%= product.PPprecio.ToString("0.00") %></p>
                        <button class="btn btn-detail" onclick="viewDetail(<%= product.PId %>)">Ver Detalle</button>
                        <button class="btn btn-cart" onclick="addToCart(<%= product.PId %>)">Agregar al Carrito</button>
                    </div>
                <% } %>
            </div>
            <script>
                function viewDetail(id) {
                    window.location.href = 'ProductDetail.aspx?id=' + id;
                }

                function addToCart(id) {
                    // Aquí puedes definir la lógica para agregar el producto al carrito
                    alert('Producto ' + id + ' agregado al carrito.');
                }
            </script>

            <!-- fin CATÁLOGO PRODUCTOS -->

        </div>
    </div>
    <!-- Shop End -->

    <!-- Page Header Start -->
    <div class="container-fluid bg-secondary mb-5">
        <div class="d-flex flex-column align-items-center justify-content-center" style="min-height: 300px">
            <h1 class="font-weight-semi-bold text-uppercase mb-3">
                <asp:Label ID="lblPageTitle" runat="server" Text="Detalle de la Tienda" CssClass="font-weight-semi-bold text-uppercase mb-3"></asp:Label>
            </h1>
            <div class="d-inline-flex">
                <p class="m-0">
                    <asp:HyperLink ID="hlHome" runat="server" NavigateUrl="~/" Text="Inicio"></asp:HyperLink>
                </p>
                <p class="m-0 px-2">-</p>
                <p class="m-0">
                    <asp:Label ID="lblCurrentPage" runat="server" Text="Detalle de la Tienda"></asp:Label>
                </p>
            </div>
        </div>
    </div>
<!-- Page Header End -->


</asp:Content>
