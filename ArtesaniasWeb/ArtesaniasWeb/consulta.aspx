<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="consulta.aspx.cs" Inherits="ArtesaniasWeb.consulta" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f4f4f9;
        }

        #form1 {
            display: flex;
            flex-direction: column;
            align-items: center;
        }

        h1 {
            color: #2c3e50;
            text-align: center;
            padding: 20px;
            font-size: 2em;
        }

        .search-bar {
            display: flex;
            justify-content: space-between;
            width: 100%;
            max-width: 900px;
            padding: 10px;
            background-color: #34495e;
            color: #fff;
        }

        .search-bar input[type="text"] {
            width: 70%;
            padding: 8px;
            border-radius: 5px;
            border: none;
        }

        .search-bar p {
            margin: 0;
            padding: 0;
            font-size: 1em;
        }

        .products {
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
            margin-top: 20px;
        }

        .product {
            background-color: #fff;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0,0,0,0.1);
            margin: 10px;
            padding: 15px;
            width: 200px;
            text-align: center;
        }

        .product img {
            max-width: 100%;
            border-radius: 8px;
            margin-bottom: 10px;
        }

        .product label {
            font-size: 1.2em;
            color: #e74c3c;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">

        <h1>La tienda del INCA</h1> 

        <div>

            <div clas="search-bar">
                
                    <asp:TextBox runat="server" ID="txtBuscar" />
                    <asp:Button Text="Buscar" runat="server" Id="Buscar" OnClick="btnBuscar_Click" /> <p>Mis compras</p>
                
            </div>
            <asp:GridView runat="server" ID="gvConsulta" > </asp:GridView>

            <!-- Sección de Textiles -->
            <div class="category">
                <div class="category-title">Textiles</div>
                <div class="products">
                    <div class="product">
                        <p>Poncho Andino</p>
                        <img src="Imagenes/Poncho.jpg" alt="Poncho"/>
                        <label>$180</label>
                    </div>
                    <div class="product">
                        <p>Chullo de Alpaca</p>
                        <img src="Imagenes/Chullo.jpg" alt="Chullo"/>
                        <label>$50</label>
                    </div>
                    <div class="product">
                        <p>Bufanda de Alpaca</p>
                        <img src="Imagenes/Bufanda.jpg" alt="Bufanda"/>
                        <label>$60</label>
                    </div>
                </div>
            </div>

            <!-- Sección de Cerámica -->
            <div class="category">
                <div class="category-title">Cerámica</div>
                <div class="products">
                    <div class="product">
                        <p>Vasija Decorativa</p>
                        <img src="Imagenes/Vasija.jpg" alt="Vasija"/>
                        <label>$75</label>
                    </div>
                    <div class="product">
                        <p>Taza Inca</p>
                        <img src="Imagenes/Taza.jpg" alt="Taza"/>
                        <label>$25</label>
                    </div>
                    <div class="product">
                        <p>Jarrón de Cerámica</p>
                        <img src="Imagenes/Jarron.jpg" alt="Jarrón"/>
                        <label>$90</label>
                    </div>
                </div>
            </div>

            <!-- Sección de Joyería -->
            <div class="category">
                <div class="category-title">Joyería</div>
                <div class="products">
                    <div class="product">
                        <p>Pulsera de Plata</p>
                        <img src="Imagenes/Pulsera.jpg" alt="Pulsera"/>
                        <label>$120</label>
                    </div>
                    <div class="product">
                        <p>Collar de Plata</p>
                        <img src="Imagenes/Collar.jpg" alt="Collar"/>
                        <label>$200</label>
                    </div>
                    <div class="product">
                        <p>Anillo de Plata</p>
                        <img src="Imagenes/Anillo.jpg" alt="Anillo"/>
                        <label>$180</label>
                    </div>
                </div>
            </div>

            <!-- Sección de Tallados -->
            <div class="category">
                <div class="category-title">Tallados</div>
                <div class="products">
                    <div class="product">
                        <p>Escultura de Madera</p>
                        <img src="Imagenes/Escultura.jpg" alt="Escultura"/>
                        <label>$80</label>
                    </div>
                    <div class="product">
                        <p>Máscara Ceremonial</p>
                        <img src="Imagenes/Mascara.jpg" alt="Máscara"/>
                        <label>$150</label>
                    </div>
                    <div class="product">
                        <p>Estatua de Cóndor</p>
                        <img src="Imagenes/Condor.jpg" alt="Cóndor"/>
                        <label>$250</label>
                    </div>
                </div>
            </div>



        </div>
    </form>
</body>
</html>
