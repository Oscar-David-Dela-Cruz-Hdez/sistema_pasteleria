<head>
    <link rel="stylesheet" href="/css/frmLogin.css">
    <link rel="stylesheet" href="C:\xampp\htdocs\Sistema_Pasteleria\css\frmLogin.css">
    <meta charset="UTF-8">
    <link href="https://unpkg.com/aos@2.3.1/dist/aos.css" rel="stylesheet">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    <style>
 
body {
    font-family: sans-serif;
    width: 100%;
    
    text-decoration: uppercase;
    text-align: center;
    /* background: #221728; */
    /* background: #40576d; */
    background: url(images/Background.png) no-repeat 0px 0px ;
    background-size: cover;
    background-attachment: fixed;
    background-repeat: no-repeat;
    backdrop-filter: inherit;
    background-size: cover;
    background-attachment: fixed;
    background-position: center;
    /* background-color: #40576d; */

    background-blend-mode: overlay color-burn;
    /* background-blend-mode: darken; */
    /* background-blend-mode: lighten */
    /* background-blend-mode: color-dodge; */
    /* background-blend-mode: color-burn; */
    /* background-blend-mode: hard-light; */
    padding-top: 4rem;
    padding-bottom: 4rem;
    padding-left: 4rem;
}
.login-form {
    justify-content: center;
    width: 30%;
    margin: 0 auto;
    background-size: cover;
    color: #ffffff;
    background-position: center;
    opacity: inherit;
    
    padding:3rem;
    border-radius: 30px;
    box-shadow: #fff 20px 5px 399px;
    top: 0%;
    left: 0%;
}
input{
    font-family: Arial, Helvetica, sans-serif;
    width:240px;
    height:40px;
    color: hsl(180, 0.90%, 22.20%);
    border: solid 0px;
    box-shadow:3px 3px 100px #75baff;
    border-color: #e9e9e9;
}
#user:hover{
  

    background-color: #cade86;

}
 #pass:hover{ 
    background-color: #cade86;

}


.abt:hover{

color: #006bee;
    background-color: #ebeff6;
border: 2px solid  #0090ff;
}
.abt{
text-decoration: none;
background-color: #006bee;
 color: #ebeff6;
border-radius: 8px;

/* width: 4px; */
/* height: 8px; */
/* font-weight: 70px; */
    padding:10px 18px;
    margin: 1px 10px;
border: 2px solid  #a9a9a9;
box-shadow: #f0e2e2 2px 2px 23px;


}
a:hover{
color: #0080ff;


}
h1{
/* border-bottom:solid 3px #e9e9e9; */

}


    </style>
    <form data-aos="zoom-out-down" id="login-form" class="login-form" method="post"
        action="/Sistema_Pasteleria/index?clase=controladorCarrito&metodo=continuarCompra" >
        <!-- Datos para carrito -->
        <input type="hidden" name="cantidad" value='<?php echo json_encode($cantidades)?>'>

        <input type="hidden" name="productosSeleccionados" value="<?php echo json_encode($productosSeleccionados);?>">
        <input type="hidden" name="costoEnvioId" value="<?php echo ($costoEnvioId);?>">
        <!--  -->
        <h1>Continua</h1>
        <div>
            <input type="text" name="txtusuario" required placeholder="nombre de usuario"
            pattern="{1,10}" maxlength="10" 
            title="El nombre de usuario solo debe contener 10 caracteres">
        </div>
        <br><br />
        <div>
            <input type="password" name="txtpassword" required placeholder="ingrese su password">
        </div>
        <br>
        <br>
        <div>
            <input  class="abt" type="submit" name="registrar" value="procesar">
        </div>

        <a href="/Sistema_Pasteleria/index?clase=controladorCliente&metodo=AltaCliente" id="registrar">Registrarme</a>
        <a href="/Sistema_Pasteleria/index?clase=controladorprincipal&metodo=interfazUsuario" type="submit"
            value="Volver">Volver</a>
    </form>
</body>
<script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>

<script>
    AOS.init();
</script>

