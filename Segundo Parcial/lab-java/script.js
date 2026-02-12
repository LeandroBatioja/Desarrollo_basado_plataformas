document.getElementById("formRegistro").addEventListener("submit", function(event){
    //evitar que la pagina se recargue
    event.preventDefault();

    //asignar valores del formulario a las variables
    let nombre=document.getElementById("nombre").value;
    let correo=document.getElementById("correo").value;
    let edad=document.getElementById("edad").value;

    if(nombre === '' || correo === '' || edad === ''){
        document.getElementById('mensaje').textContent='Todos los campos deben ser obligatorios';
        return;
    }

    if (edad < 18) {
        document.getElementById('mensaje').textContent="Debe ser mayor de edad";
        return;
    }

    document.getElementById("mensaje").textContent="Todo correcto";

    document.getElementById("formRegistro").reset();

});