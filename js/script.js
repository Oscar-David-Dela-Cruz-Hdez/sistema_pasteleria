
    document.getElementById("registroForm").addEventListener("submit", function(event) {
        // Seleccionar todos los campos requeridos
        const campos = document.querySelectorAll("#registroForm input[required]");
        let formularioValido = true;

        campos.forEach(campo => {
            // Quitar la clase de error para que no persista en cada intento
            campo.classList.remove("error");

            // Si el campo está vacío, agregar la clase de error
            if (!campo.value) {
                campo.classList.add("error");
                formularioValido = false;
            }
        });

        // Si algún campo está vacío, evitar el envío del formulario
        if (!formularioValido) {
            event.preventDefault();
            alert("Por favor, complete todos los campos requeridos.");
        }
    });
