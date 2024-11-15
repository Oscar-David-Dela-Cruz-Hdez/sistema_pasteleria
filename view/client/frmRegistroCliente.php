
<form class="form" action="/Sistema_Pasteleria/index?clase=controladorCliente&metodo=AltaCliente" method="POST">

    <link rel="stylesheet" href="css/estilos.css">
    <link rel="stylesheet" href="css/rojo.css">
    <script src="js/script.js"></script>
    <h2>Bienvenido</h2>
<form id="registroForm">
    <div class="form-group">
        <label for="nombre">Nombre:</label>
        <input type="text" id="nombre" name="txtNombreP" required 
               pattern="[A-Za-z]{1,18}" maxlength="18" 
               title="El nombre solo debe contener letras y hasta 18 caracteres">
    </div>
    <div class="form-group">
        <label for="ap">Apellido Paterno:</label>
        <br>
        <input type="text" id="ap" name="txtAP" required 
               pattern="[A-Za-z]{1,18}" maxlength="18" 
               title="El apellido paterno solo debe contener letras y hasta 18 caracteres">
    </div>
    <div class="form-group">
        <label for="am">Apellido Materno:</label>
        <br>
        <input type="text" id="am" name="txtAM" required 
               pattern="[A-Za-z]{1,18}" maxlength="18" 
               title="El apellido materno solo debe contener letras y hasta 18 caracteres">
    </div>
    <div class="form-group">
        <label for="correo">Correo electrónico</label>
        <br>
        <input type="email" id="correo" name="txtCorreo" title="Ingrese su correo electrónico">
    </div>
    <div class="form-group">
        <label for="tel">Número telefónico</label>
        <br>
        <input type="text" id="numero" name="txtNTel" required 
               pattern="\d{10}" maxlength="10" 
               title="El número telefónico debe tener exactamente 10 dígitos">
    </div>
    <div class="form-group">
        <label for="usuario">Usuario:</label>
        <br>
        <input type="text" id="usuario" name="txtUsuario" required
               title="Ingrese su nombre de usuario">
    </div>
    <div class="form-group">
        <label for="password">Password:</label>
        <br>
        <input type="password" id="password" name="txtPassword" required
               title="Ingrese su contraseña">
    </div>
    <button type="submit">Crear Cuenta</button>
</form>

<br></br>
