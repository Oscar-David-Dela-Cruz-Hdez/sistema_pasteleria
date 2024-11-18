<form class="form" id="formRegistro" action="/Sistema_Pasteleria/index?clase=controladorEmpleado&metodo=insertarEmpleado" method="POST">
    <link rel="stylesheet" href="css/estiloTabla.css">
    <h2>Registrar Nuevo Empleado</h2>

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
        <input type="email" id="correo" name="txtCorreo" required pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,}$" title="Debe ser un correo electrónico válido">
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

    <div class="form-group">
        <button type="submit">Registrar</button>
    </div>

</form>

<br></br>

<script>
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
