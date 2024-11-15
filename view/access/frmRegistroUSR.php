<head>
    <link rel="stylesheet" href="/css/frmLogin.css">
    <link rel="stylesheet" href="C:\xampp\htdocs\Sistema_Pasteleria\css\frmLogin.css">
    <meta charset="UTF-8">
    <link href="https://unpkg.com/aos@2.3.1/dist/aos.css" rel="stylesheet">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>registro</title>
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
            background: url(images/Background.png) no-repeat 0px 0px;
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

            padding: 3rem;
            border-radius: 30px;
            box-shadow: #fff 20px 5px 399px;
            top: 0%;
            left: 0%;
        }

        input {
            width: 250px;
            height: 35px;
            /* color: #000000;
             */
            color: hsl(180, 0.90%, 22.20%);

            font-family: Arial, Helvetica, sans-serif;
        }

        input:hover {


            background-color: #cade86;

        }

        input:hover {
            background-color: #cade86;

        }


        #bt:hover {

            color: #006bee;
            background-color: #ebeff6;
            border: 2px solid #0090ff;

        }

        .abt {
            text-decoration: none;
            background-color: #e9e9e9;
            /* border-radius: 25px; */
            /* margin: black; */
            color: #000000;
            border-radius: 3px;
            /* width: 4px; */
            /* height: 8px; */
            /* font-weight: 70px; */
            padding: 6px 15px;
            margin: 1px 10px;
            border: 2px solid #a9a9a9;
            box-shadow: #f0e2e2 2px 2px 23px;


        }

        #bt:hover {
            top: 0%;
            border-radius: 4px;
            color: #75baff;

            cursor: pointer;
        }
    </style>



    <form data-aos="zoom-out-down" id="login-form" class="login-form" action="/Sistema_Pasteleria/index?clase=controladorCliente&metodo=AltaCliente" method="POST">

        <!-- <link rel="stylesheet" href="css/estilos.css"> -->

        <h2>Registrate</h2>
        <div class="form-group">
            <label for="nombre">Nombre:</label>
            <br>
            <input type="text" id="nombre" name="txtNombreP" required
            pattern="[A-Za-z]{1,18}" maxlength="18" 
            title="El nombre solo debe contener letras y un maximo de 18 caracteres">
        </div>
        <div class="form-group">

            <div class="form-group">
                <label for="ap">Apellido Paterno:</label>
                <br>
                <input type="text" id="ap" name="txtAP" required
                pattern="[A-Za-z]{1,18}" maxlength="18" 
                title="El apellido solo debe contener letras y un maximo de 18 caracteres">
            </div>
            <div class="form-group">
                <label for="ap">Apellido Materno:</label>
                <br>
                <input type="text" id="am" name="txtAM" required
                pattern="[A-Za-z]{1,18}" maxlength="18" 
                title="El apellido solo debe contener letras y un maximo de 18 caracteres">
            </div>
            <div class="form-group">
                <label for="correo">Correo electrónico</label>
                <br>
                <input type="email" id="correo" name="txtCorreo" required
                title="ingrese su correo electronico">
            </div>

            <div class="form-group">
                <label for="tel">Número télefonico</label>
                <br>
                <input type="number" id="numero" name="txtNTel" required
                pattern="\d{10}" maxlength="10" 
                title="El número telefónico debe tener exactamente 10 dígitos">
            </div>





            <label for="usuario"> Usuario:</label>
            <br>
            <input type="text" id="usuario" name="txtUsuario" required
            pattern="{1,18}" maxlength="18" 
            title="El nombre de usuario solo debe contener 18 caracteres"></input>

        </div>
        <div class="form-group">
            <label for="password">password:</label>
            <br>
            <input type="password" id="password" name="txtPassword" required
            title="ingrese su contraseña"></input>
        </div>
        </div>
        <br>

        <!-- <div class="form-group">
    <label for="estatura">Cantidad Leches:</label>
    <input type="text" id="estatura" name="txt" required>
</div> -->

        <div class="form-group">
            <button id="bt" type="submit">Crear cuenta</button>
            <br>
            <a href="/Sistema_Pasteleria/index?clase=controladorprincipal&metodo=interfazUsuario" type="submit" value="Volver">Volver</a>
        </div>

    </form>

    <br></br>
</body>.
<script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>

<script>
    AOS.init();
</script>