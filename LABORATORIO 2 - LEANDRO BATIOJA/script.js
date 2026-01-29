document.getElementById("Registro").addEventListener("submit", function(event){
    // 1. Evitar que la pagina se recargue
    event.preventDefault();

    // 2. Aplicar variables (AJUSTADAS A TUS IDs DEL HTML)
    let nombre = document.getElementById("nombre").value;
    let correo = document.getElementById("correo").value;
    let edad = document.getElementById("edad").value;
    let fecha = document.getElementById("Fecha_nacimiento").value; 
    let telefono = document.getElementById("phone").value;         
    let carrera = document.getElementById("Carrera").value;       
    let comentario = document.getElementById("coments").value;     

    // 3. Validación
    if(nombre === '' || correo === '' || edad === '' || carrera === ''){
        document.getElementById('mensaje').textContent = 'Obligatorio llenar estos campos';
        return;
    }

    // 4. Para modalidad buscaremos el que esté marcado
    let modalidadPresencial = document.getElementById("presencial").checked;
    let modalidadSeleccionada = modalidadPresencial ? "Presencial" : "Virtual";

    // 5. Mostrar lo que el usuario seleccionó
    document.getElementById("mensaje").innerHTML = 
    "<strong>Datos recibidos: </strong> <br>" + 
    "Nombre: " + nombre + "<br>" + 
    "Correo: " + correo + "<br>" + 
    "Edad: " + edad + "<br>" + 
    "Fecha: " + fecha + "<br>" + 
    "Teléfono: " + telefono + "<br>" + 
    "Carrera: " + carrera + "<br>" + 
    "Modalidad: " + modalidadSeleccionada + "<br>" +
    "Comentario: " + comentario;

    // 6. Limpiamos el formulario
    document.getElementById("Registro").reset();
});