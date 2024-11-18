
<head>
        <link rel="stylesheet" href="/css/frmLogin.css">
    <link rel="stylesheet" href="C:\xampp\htdocs\Sistema_Pasteleria\css\frmLogin.css">
    <meta charset="UTF-8">
    <link href="https://unpkg.com/aos@2.3.1/dist/aos.css" rel="stylesheet">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>log in</title>
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
            width: 25%; /* Reduce el ancho del formulario */
            margin: 0 auto;
            padding: 2rem; /* Ajusta el relleno para adaptarse al nuevo tamaño */
            border-radius: 15px;
            background-color: rgba(0, 0, 0, 0.7);
            color: #fff;
            box-shadow: 0px 4px 15px rgba(255, 255, 255, 0.5);  
}
#user,#pass{
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
background-color:rgb(0, 102, 255);
/* border-radius: 25px; */
/* margin: black; */
color: #000000;
border-radius: 8px;

/* width: 4px; */
/* height: 8px; */
/* font-weight: 70px; */
    padding:10px 18px;
    margin: 1px 10px;
border: 2px solid  #a9a9a9;
box-shadow: #f0e2e2 2px 2px 23px;

}
.Registrarse:hover{
color: #0080ff;
}
h1{
border-bottom:solid 3px #e9e9e9;
}

    </style>
    <form   data-aos="zoom-out-down" id="login-form" class="login-form" method="post" action="/Sistema_Pasteleria/index?clase=controladorlogin&metodo=Acceder">
        <h1>Bienvenido</h1>
        <!-- <link rel="stylesheet" href="/css/frmLogin.css"> -->
       <div>
           <input type="text"   id="user" name="txtusuario" required placeholder="nombre de usuario"
           pattern="{1,10}" maxlength="10" 
           title="El nombre de usuario solo debe contener 10 caracteres">
       </div>
        <br><br />
        <div>
            <input type="password"  id="pass" width="60px" height="100px" name="txtpassword"  required placeholder="ingrese su password"
            pattern="[A-Za-z0-9]{1,10}", maxlength="10"
            tittle="ingrese su contraseña">
            
        </div>
        <br>
        <br>
        <div>
            <input class="abt" type="submit" value="Acceder" name="registrar">   
             <a class="abt" href="/Sistema_Pasteleria/index?clase=controladorprincipal&metodo=interfazUsuario"  type="submit" value="Volver">Volver</a>         
        </div>
<br>
        <a class="Registrarse" href="/Sistema_Pasteleria/index?clase=controladorCliente&metodo=AltaCliente" id="registrar">Registrarme</a>
    </form>
</body>.
<script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>

<script>
  AOS.init();

  // Verificar si el formulario es válido al enviarlo
  document.getElementById("login-form").addEventListener("submit", function (event) {
    if (!this.checkValidity()) {
      event.preventDefault(); // Evitar el envío si hay campos inválidos
      alert("Por favor, completa todos los campos correctamente.");
    }
  });

  // Función para evitar números y caracteres especiales directamente
  function bloquearCaracteres(event) {
    const char = String.fromCharCode(event.which); // Obtener el carácter presionado
    const permitido = /^[a-zA-Z\s]+$/; // Regex: Solo letras y espacios

    if (!permitido.test(char)) {
      event.preventDefault(); // Bloquear carácter no permitido
    }
  }

  // Seleccionar el campo de texto del nombre de usuario
  const campoUsuario = document.querySelector('input[name="txtusuario"]');

  // Agregar evento keypress para bloquear caracteres no válidos
  campoUsuario.addEventListener("keypress", bloquearCaracteres);
</script>