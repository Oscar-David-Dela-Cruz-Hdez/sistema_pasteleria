<head>
    <link rel="stylesheet" href="/css/frmLogin.css">
    <meta charset="UTF-8">
    <link href="https://unpkg.com/aos@2.3.1/dist/aos.css" rel="stylesheet">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Registro</title>
</head>

<body>
    <style>
        .error {
            border: 2px solid red;
            background-color: #ffe6e6;
        }

        body {
            font-family: sans-serif;
            text-transform: uppercase;
            text-align: center;
            background: url(images/Background.png) no-repeat center center fixed;
            background-size: cover;
            padding: 4rem;
        }

        .login-form {
            width: 25%;
            margin: 0 auto;
            padding: 2rem;
            border-radius: 15px;
            background-color: rgba(0, 0, 0, 0.7);
            color: #fff;
            box-shadow: 0px 4px 15px rgba(255, 255, 255, 0.5);
        }

        input {
            width: 100%;
            padding: 0.5rem;
            margin-bottom: 1rem;
            font-size: 1rem;
            border: 1px solid #ccc;
            border-radius: 5px;
        }

        input:hover {
            background-color: #cade86;
        }

        #bt {
            background-color: #006bee;
            color: #fff;
            padding: 0.5rem 1rem;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }

        #bt:hover {
            background-color: #004bbf;
        }

        .abt {
            text-decoration: none;
            color: #fff;
            margin-top: 1rem;
            display: inline-block;
        }
    </style>

    <form id="formRegistro" class="login-form" action="/Sistema_Pasteleria/index?clase=controladorCliente&metodo=AltaCliente" method="POST" data-aos="zoom-out-down">
        <h2>Bienvenido</h2>
        
        <div class="form-group">
            <label for="nombre">Nombre:</label>
            <input type="text" id="nombre" name="txtNombreP" required pattern="[A-Za-z]{1,18}" maxlength="18" title="El nombre solo debe contener letras y un máximo de 18 caracteres">
        </div>
        <div class="form-group">
            <label for="ap">Apellido Paterno:</label>
            <input type="text" id="ap" name="txtAP" required pattern="[A-Za-z]{1,18}" maxlength="18" title="El apellido solo debe contener letras y un máximo de 18 caracteres">
        </div>
        <div class="form-group">
            <label for="am">Apellido Materno:</label>
            <input type="text" id="am" name="txtAM" required pattern="[A-Za-z]{1,18}" maxlength="18" title="El apellido solo debe contener letras y un máximo de 18 caracteres">
        </div>
        <div class="form-group">
            <label for="correo">Correo electrónico:</label>
            <input type="email" id="correo" name="txtCorreo" required title="Ingrese su correo electrónico">
        </div>
        <div class="form-group">
            <label for="numero">Número telefónico:</label>
            <input type="text" id="numero" name="txtNTel" required pattern="\d{10}" maxlength="10" title="El número telefónico debe tener exactamente 10 dígitos">
        </div>
        <div class="form-group">
            <label for="usuario">Usuario:</label>
            <input type="text" id="usuario" name="txtUsuario" required pattern="[A-Za-z0-9]{1,10}" maxlength="10" title="El nombre de usuario solo debe contener letras y números, y un máximo de 10 caracteres">
        </div>
        <div class="form-group">
            <label for="password">Password:</label>
            <input type="password" id="password" name="txtPassword" required pattern="[A-Za-z0-9]{1,10}" maxlength="10" title="Ingrese su contraseña">
        </div>
        
        <button id="bt" type="submit">Crear cuenta</button>
        <a href="/Sistema_Pasteleria/index?clase=controladorprincipal&metodo=interfazUsuario" class="abt">Volver</a>
    </form>
    <br></br>
</body>
<script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>
<script>
    AOS.init();
    // Validación del formulario
    document.getElementById("formRegistro").addEventListener("submit", function(event) {
        if (!this.checkValidity()) {
            event.preventDefault();
            const camposInvalidos = this.querySelectorAll(':invalid');
            camposInvalidos.forEach(campo => campo.classList.add('error'));
            alert("Por favor, completa todos los campos correctamente.");
        }
    });

    // Evitar números en campos de texto (nombre, apellido paterno y apellido materno)
    const camposTexto = document.querySelectorAll('#usuario,#nombre, #ap, #am');
    camposTexto.forEach(campo => {
        campo.addEventListener('input', event => {
            event.target.value = event.target.value.replace(/[0-9]/g, ''); // Eliminar números
            if (event.target.validity.valid) {
                event.target.classList.remove('error');
            }
        });
    });

    // Permitir solo números en ciertos campos (teléfono)
    const camposNumericos = document.querySelectorAll('#numero');
    camposNumericos.forEach(campo => {
        campo.addEventListener('input', event => {
            event.target.value = event.target.value.replace(/\D/g, ''); // Eliminar caracteres no numéricos
            if (event.target.validity.valid) {
                event.target.classList.remove('error');
            }
        });
    });

    // Evitar caracteres especiales en los campos de nombre, apellido paterno y apellido materno
    camposTexto.forEach(campo => {
        campo.addEventListener('input', event => {
            // Reemplazar todo lo que no sea letra (y permitir espacios)
            event.target.value = event.target.value.replace(/[^A-Za-z\s]/g, '');
            if (event.target.validity.valid) {
                event.target.classList.remove('error');
            }
        });
    });
</script>
