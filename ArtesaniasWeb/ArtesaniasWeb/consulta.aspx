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

        /* Estilo para las categorías */
        .category {
            width: 100%;
            max-width: 900px;
            margin-top: 20px;
        }
        
        .category-title {
            font-size: 1.5em;
            color: #34495e;
            margin-bottom: 15px;
            border-bottom: 2px solid #34495e;
            padding-bottom: 5px;
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

            <div class="search-bar">
                
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
                        <img src="Imagenes/T-Poncho.jpg" alt="Poncho Andino"/>
                        <label>$180</label>
                    </div>
                    <div class="product">
                        <p>Chullo de Alpaca</p>
                        <img src="Imagenes/T-Chullo_Alpaca.jpg" alt="Chullo"/>
                        <label>$50</label>
                    </div>
                    <div class="product">
                        <p>Bufanda de Alpaca</p>
                        <img src="Imagenes/T-Bufanda_Alpaca.jpg" alt="Bufanda"/>
                        <label>$60</label>
                    </div>
                    <div class="product">
                        <p>Tejido de Llama</p>
                        <img src="Imagenes/T-Tejido_Llama.jpg" alt="Tejido de Llama"/>
                        <label>$85</label>
                    </div>
                    <div class="product">
                        <p>Chal de Alpaca</p>
                        <img src="Imagenes/T-Chal_Alpaca.jpg" alt="Chal de Alpaca"/>
                        <label>$90</label>
                    </div>
                    <div class="product">
                        <p>Poncho de Lana</p>
                        <img src="Imagenes/T-Poncho_Lana.jpeg" alt="Poncho de Lana"/>
                        <label>$160</label>
                    </div>
                    <div class="product">
                        <p>Bufanda de Llama</p>
                        <img src="Imagenes/T-Bufanda_Llama.jpg" alt="Bufanda de Llama"/>
                        <label>$75</label>
                    </div>
                    <div class="product">
                        <p>Gorro de Alpaca</p>
                        <img src="Imagenes/T-Gorro_Alpaca.jpeg" alt="Gorro de Alpaca"/>
                        <label>$45</label>
                    </div>
                    <div class="product">
                        <p>Chaleco de Lana</p>
                        <img src="Imagenes/T-Chaleco_Lana.jpg" alt="Chaleco de Lana"/>
                        <label>$130</label>
                    </div>
                    <div class="product">
                        <p>Jersey de Alpaca</p>
                        <img src="Imagenes/T-Jersey_Alpaca.jpg" alt="Jersey de Alpaca"/>
                        <label>$100</label>
                    </div>
                    <div class="product">
                        <p>Tejido Inca</p>
                        <img src="Imagenes/T-Tejido_Inca.jpg" alt="Tejido Inca"/>
                        <label>$110</label>
                    </div>
                    <div class="product">
                        <p>Bufanda Inca</p>
                        <img src="Imagenes/T-Bufanda_Inca.jpg" alt="Bufanda Inca"/>
                        <label>$65</label>
                    </div>
                </div>
            </div>

            <!-- Sección de Cerámica -->
            <div class="category">
                <div class="category-title">Cerámica</div>
                <div class="products">
                    <div class="product">
                        <p>Vasija Decorativa</p>
                        <img src="Imagenes/C-Vasija_Decorativax.jpg"  alt="Vasija Decoratica"/>
                        <label>$75</label>
                    </div>
                    <div class="product">
                        <p>Taza Inca</p>
                        <img src="Imagenes/C-Taza_Inca.jpeg"  alt="Taza Inca" />
                        <label>$25</label>
                    </div>
                    <div class="product">
                        <p>Jarrón de Cerámica</p>
                        <img src="Imagenes/C-Jarron.jpg"  alt="Jarrón de Cerámica"/>
                        <label>$90</label>
                    </div>
                    <div class="product">
                        <p>Plato Cerámico</p>
                        <img src="Imagenes/C-Plato.jpg"  alt="Plato Cerámico"/>
                        <label>$45</label>
                    </div>
                    <div class="product">
                        <p>Vaso Decorado</p>
                        <img src="Imagenes/C-Vaso_Decorado.jpg" alt="Vaso Decorado"/>
                        <label>$40</label>
                    </div>
                    <div class="product">
                        <p>Cuenco Inca</p>
                        <img src="Imagenes/C-Cuenca_Inca.jpeg" alt="Cuenco Inca"/>
                        <label>$35</label>
                    </div>
                    <div class="product">
                        <p>Jarrón de los Andes</p>
                        <img src="Imagenes/C-Jarron_Andes.jpg" alt="Jarrón de los Andes"/>
                        <label>$95</label>
                    </div>
                    <div class="product">
                        <p>Olla Tradicional</p>
                        <img src="Imagenes/C-Olla_Tradicional.jpg" alt="Olla Tradicional"/>
                        <label>$110</label>
                    </div>
                    <div class="product">
                        <p>Vasija Inca</p>
                        <img src="Imagenes/C-Vasija_Inca.jpeg" alt="Vasija Inca"/>
                        <label>$80</label>
                    </div>
                    <div class="product">
                        <p>Jarrón de Cerámica Roja</p>
                        <img src="Imagenes/C-Jarron_Rojo.jpg" alt="Jarrón de Cerámica Roja"/>
                        <label>$105</label>
                    </div>
                    <div class="product">
                        <p>Plato de la Tierra</p>
                        <img src="Imagenes/C-Plato_Tierra.jpg" alt="Plato de la Tierra"/>
                        <label>$50</label>
                    </div>
                    <div class="product">
                        <p>Alfarería Andina</p>
                        <img src="Imagenes/C-Alfareria_Andina.jpg" alt="Alfarería Andina"/>
                        <label>$120</label>
                    </div>
                </div>
            </div>

            <!-- Sección de Joyería -->
            <div class="category">
                <div class="category-title">Joyería</div>
                <div class="products">
                    <div class="product">
                        <p>Pulsera de Plata</p>
                        <img src="Imagenes/J-Pulcera_Plata.jpeg" alt="Pulsera"/>
                        <label>$120</label>
                    </div>
                    <div class="product">
                        <p>Collar de Plata</p>
                        <img src="Imagenes/J-Collar_Plata.jpg" alt="Collar"/>
                        <label>$200</label>
                    </div>
                    <div class="product">
                        <p>Anillo de Plata</p>
                        <img src="Imagenes/J-Anillo_Plata.jpg" alt="Anillo"/>
                        <label>$180</label>
                    </div>
                    <div class="product">
                        <p>Pulsera Inca</p>
                        <img src="Imagenes/J-Pulcera_Inca.jpg" alt="Pulsera Inca"/>
                        <label>$130</label>
                    </div>
                    <div class="product">
                        <p>Collar Andino</p>
                        <img src="Imagenes/J-Collar_Andino.jpg" alt="Collar Andino"/>
                        <label>$150</label>
                    </div>
                    <div class="product">
                        <p>Anillo de Oro</p>
                        <img src="Imagenes/J-Anillo_Oro.jpeg" alt="Anillo de Oro"/>
                        <label>$220</label>
                    </div>
                    <div class="product">
                        <p>Pulsera de Oro</p>
                        <img src="Imagenes/J-Pulsera_Oro.jpg"  alt="Pulsera de Oro"/>
                        <label>$250</label>
                    </div>
                    <div class="product">
                        <p>Collar de Jade</p>
                        <img src="Imagenes/J-Collar_Jade.jpg" alt="Collar de Jade"/>
                        <label>$180</label>
                    </div>
                    <div class="product">
                        <p>Pendientes de Plata</p>
                        <img src="Imagenes/J-Pendiente_Plata.jpg" alt="Pendientes"/>
                        <label>$100</label>
                    </div>
                    <div class="product">
                        <p>Anillo Inca</p>
                        <img src="Imagenes/J-Anillo_Inca.jpeg" alt="Anillo Inca"/>
                        <label>$140</label>
                    </div>
                    <div class="product">
                        <p>Collar de Coral</p>
                        <img src="Imagenes/J-Collar_Coral.jpg" alt="Collar de Coral"/>
                        <label>$160</label>
                    </div>
                    <div class="product">
                        <p>Pulsera Andina</p>
                        <img src="Imagenes/J-Pulsera_Andina.jpg" alt="Pulsera Andina"/>
                        <label>$110</label>
                    </div>
                </div>
            </div>

            <!-- Sección de Tallados -->
            <div class="category">
                <div class="category-title">Tallados</div>
                <div class="products">
                    <div class="product">
                        <p>Escultura de Madera</p>
                        <img src="Imagenes/TA-Escultura.jpg" alt="Escultura"/>
                        <label>$80</label>
                    </div>
                    <div class="product">
                        <p>Máscara Ceremonial</p>
                        <img src="Imagenes/TA-Mascara_Ceremonial.jpeg" alt="Máscara"/>
                        <label>$150</label>
                    </div>
                    <div class="product">
                        <p>Estatua de Cóndor</p>
                        <img src="Imagenes/TA-Condorx.jpg" alt="Cóndor"/>
                        <label>$250</label>
                    </div>
                    <div class="product">
                        <p>Escultura de Piedra</p>
                        <img src="Imagenes/TA-Escultura_Piedra.jpg" alt="Escultura de Piedra"/>
                        <label>$120</label>
                    </div>
                    <div class="product">
                        <p>Máscara de la Selva</p>
                        <img src="Imagenes/TA-Mascara_Selva.jpeg" alt="Máscara de la Selva"/>
                        <label>$170</label>
                    </div>
                    <div class="product">
                        <p>Estatua Inca</p>
                        <img src="Imagenes/TA-EstatuaInca.jpg" alt="Estatua Inca"/>
                        <label>$200</label>
                    </div>
                    <div class="product">
                        <p>Escultura Andina</p>
                        <img src="Imagenes/TA-Escultura_Andina.jpg" alt="Escultura Andina"/>
                        <label>$250</label>
                    </div>
                    <div class="product">
                        <p>Máscara Andina</p>
                        <img src="Imagenes/TA-Mascara.jpeg" alt="Máscara Andina"/>
                        <label>$140</label>
                    </div>
                    <div class="product">
                        <p>Figura de Llama</p>
                        <img src="Imagenes/TA-Figura_Llama.jpg" alt="Figura de Llama"/>
                        <label>$130</label>
                    </div>
                    <div class="product">
                        <p>Escultura de Madera Oscura</p>
                        <img src="Imagenes/TA-Escultura_Madera_Oscura.jpeg" alt="Escultura de Madera Oscura"/>
                        <label>$180</label>
                    </div>
                    <div class="product">
                        <p>Estatua de Guerrero</p>
                        <img src="Imagenes/TA-Estatua_Guerrero.jpg" alt="Estatua de Guerrero"/>
                        <label>$220</label>
                    </div>
                    <div class="product">
                        <p>Máscara de Guerrero</p>
                        <img src="Imagenes/TA-Mascara_Guerrero.jpg" alt="Máscara de Guerrero"/>
                        <label>$180</label>
                    </div>
                </div>
            </div>



        </div>
    </form>
</body>
</html>
