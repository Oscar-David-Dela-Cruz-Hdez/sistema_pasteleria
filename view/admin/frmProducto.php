<form class="form" action="/Sistema_Pasteleria/index?clase=controladorProducto&metodo=AltaProducto" method="POST" enctype="multipart/form-data">
    <h2>Registro de Producto</h2>

    <link rel="stylesheet" href="css/estiloTabla.css">

    <div class="form-group">
        <label for="nombre">Nombre:</label>
        <br>
        <input type="text" id="sabor" name="txtNombre" required>
    </div>
    <br>

    <div class="form-group">
        <label for="Sabor">Sabor:</label>
        <br>
        <Select name="txtSabor">
            <?php while ($fila = $traeSabor->fetch_object()) { ?>
                <option value="<?php echo $fila->idSabor; ?>">
                    <?php echo $fila->vchSabor; ?>
                </option>
            <?php } ?>
        </Select>
    </div>

    <div class="form-group">
        <label for="ap">Precio:</label>
        <input type="text" id="precio" name="txtPrecio" required>
    </div>
    <br>
    <td><label>Imagen</label>
        <br>
        <input  type="file" class="form-control form-control-sm" name="imag" id="imag" class="form-control-file mt-2" id="exampleFormControlFile1">
    </td>
    </tr>
    <br>
    <br>

    <div class="form-group">
        <label for="tipo">Tipo:</label>
        <Select name="txtTipo">
            <br>
            <?php while ($fila = $traeTipo->fetch_object()) { ?>
                <option value="<?php echo $fila->idTipo; ?>">
                    <?php echo $fila->NombreTipo; ?>
                </option>
            <?php } ?>
        </Select>
    </div>
    <br>
    <div class="form-group">
        <button type="submit">Agregar</button>
    </div>
</form>

<div>
    <?php include_once($vista); ?>
</div>
<br></br>

<script>
    // Validación para el campo de Nombre: solo letras
    const campoNombre = document.getElementById('sabor');
    campoNombre.addEventListener('input', function(event) {
        // Eliminar cualquier número o carácter especial
        event.target.value = event.target.value.replace(/[^A-Za-z\s]/g, '');
        if (event.target.validity.valid) {
            event.target.classList.remove('error');
        }
    });

    // Validación para el campo de Precio: solo números
    const campoPrecio = document.getElementById('precio');
    campoPrecio.addEventListener('input', function(event) {
        // Eliminar cualquier letra o carácter especial
        event.target.value = event.target.value.replace(/[^0-9]/g, '');
        if (event.target.validity.valid) {
            event.target.classList.remove('error');
        }
    });

    // Validación general del formulario
    document.querySelector(".form").addEventListener("submit", function(event) {
        if (!this.checkValidity()) {
            event.preventDefault();
            const camposInvalidos = this.querySelectorAll(':invalid');
            camposInvalidos.forEach(campo => campo.classList.add('error'));
            alert("Por favor, complete todos los campos correctamente.");
        }
    });
</script>
