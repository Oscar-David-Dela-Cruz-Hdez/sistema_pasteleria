
<head>
        
    <meta charset="UTF-8">
    <link href="https://unpkg.com/aos@2.3.1/dist/aos.css" rel="stylesheet">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    <style>
        /* Clase para resaltar errores */
    .error {
        border: 2px solid red;
        background-color: #ffe6e6;
        color: #800000;
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

    /* Estilo para los campos de entrada */
    input[type="text"], input[type="password"], input[type="submit"] {
        width: 90%;
        padding: 0.8rem;
        margin-bottom: 1.5rem;
        font-size: 1rem;
        border: 1px solid #ccc;
        border-radius: 8px;
        outline: none;
        transition: background-color 0.3s ease, box-shadow 0.3s ease;
    }

    /* Efecto hover en los campos de entrada */
    input[type="text"]:hover, input[type="password"]:hover {
        background-color: #f0f0f0;
        box-shadow: 0 0 8px rgba(255, 255, 255, 0.5);
    }

    /* Estilo para el botón */
    input[type="submit"] {
        background-color: #006bee;
        color: #ffffff;
        cursor: pointer;
        border: none;
    }

    /* Efecto hover para el botón */
    input[type="submit"]:hover {
        background-color: #004bbf;
    }

    /* Estilo para los enlaces */
    .abt {
        text-decoration: none;
        color: #00aeff;
        margin-top: 1rem;
        display: inline-block;
        font-size: 0.9rem;
    }

    /* Efecto hover para enlaces */
    .abt:hover {
        color: #80d4ff;
    }

    /* Adaptación responsiva */
    @media (max-width: 768px) {
        .login-form {
            width: 80%;
            padding: 2rem;
        }

        input[type="text"], input[type="password"], input[type="submit"] {
            width: 100%;
        }
    }
    </style>
    
    <form   data-aos="zoom-out-down" id="login-form" class="login-form" method="post" action="/Sistema_Pasteleria/index?clase=controladorlogin&metodo=Acceder">
        <h1>Bienvenido</h1>
        <!-- <link rel="stylesheet" href="/css/frmLogin.css"> -->
       <div>
           <input type="text" name="txtusuario" required placeholder="nombre de usuario"
           pattern="{1,10}" maxlength="10" 
           title="El nombre de usuario solo debe contener un maximo de 10 caracteres">
       </div>
        <br><br/>
        <div>
            <input type="password" name="txtpassword"  required placeholder="ingrese su password"
            pattern="[A-Za-z0-9]{1,10}", maxlength="10"
            tittle="ingrese su contraseña">
        </div>
        <br>
        <br>
        <div>
            <input type="submit" name="registrar">            
        </div>

        <a href="/Sistema_Pasteleria/index?clase=controladorCliente&metodo=AltaCliente" id="registrar">Registrarme</a>
        <a href="/Sistema_Pasteleria/index?clase=controladorprincipal&metodo=interfazUsuario"  type="submit" value="Volver">Volver</a>
    </form>
</body>
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
