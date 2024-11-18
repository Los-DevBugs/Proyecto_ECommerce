<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Artesanias.aspx.cs" Inherits="ArtesaniasFeriaProjects.Artesanias" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>La tienda del INCA</title>
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

        
        <div class="search-bar">
            
            
            <input type="text" name="search" id="txtBuscar" placeholder="Buscar artesanías..."/> <p>Mis compras</p>
        </div>
        <asp:GridView runat="server" ID="gvConsulta" > 
        </asp:GridView><asp:Button runat="server" Text="Button" OnClick="Unnamed1_Click"></asp:Button>
          
        <div class="products">
            <div class="product">
                <p>Ponchos</p>
                <img src="Imagenes/Poncho.jpg" alt="Poncho"/>
                <label>$180</label>
            </div>
            <div class="product">
                <p>Jarrones</p>
                <img src="Imagenes/Jarrones.jpg" alt="Jarrón"/>
                <label>$200</label>
            </div>
            <div class="product">
                <p>Bolsos</p>
                <img src="Imagenes/Bolsos.jpg" alt="Bolso"/>
                <label>$50</label>
            </div>
        </div>
        
    </form>
</body>
</html>
