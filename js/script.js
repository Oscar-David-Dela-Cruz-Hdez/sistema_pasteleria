document.getElementById("formRegistro").addEventListener("submit", function(event) {
    // Verificar si el formulario es válido
    if (!this.checkValidity()) {
        event.preventDefault(); // Evitar el envío si hay campos inválidos
        alert("Por favor, completa todos los campos correctamente.");
    }
});

// Función para eliminar números y caracteres especiales en los campos de texto
function evitarNumerosYCaracteresEspeciales(event) {
    event.target.value = event.target.value.replace(/[^a-zA-Z\s]/g, ''); // Permitir solo letras y espacios
}

// Selecciona los campos de nombre y apellidos
const camposTexto = document.querySelectorAll('#nombre, #ap, #am');

// Agrega el evento "input" a cada campo para evitar números y caracteres especiales
camposTexto.forEach(campo => {
    campo.addEventListener('input', evitarNumerosYCaracteresEspeciales);
});
