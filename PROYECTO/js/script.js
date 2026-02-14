const URL = "https://ghibliapi.vercel.app/films";
let peliculasGlobal = [];

async function cargarPeliculas() {
        const respuesta = await fetch(URL);
        peliculasGlobal = await respuesta.json();
        mostrarPeliculas(peliculasGlobal);
}

function mostrarPeliculas(peliculas) {
    const contenedor = document.getElementById("contenedor");
    const contador = document.getElementById("contador")

    /*1.- Limpiamos el contador*/
    contenedor.innerHTML = "";

    /*2.- Actualizar el numero del contador (basado en el array)*/ 
    contador.textContent = peliculas.length;

    peliculas.forEach(pelicula => {
        contenedor.innerHTML += `
            <div class="card" onclick="seleccionar('${pelicula.id}')">
                <img src="${pelicula.image}" alt="${pelicula.title}">
                <div class="card-content">
                    <h3>${pelicula.title}</h3>
                    <p>Director: ${pelicula.director}</p>
                    <p>Año: ${pelicula.release_date}</p>
                    <button onclick="seleccionar('${pelicula.id}')"> Seleccionar </button>
                </div>
            </div>
        `;
    });
}

function seleccionar(id) {
    const pelicula = peliculasGlobal.find(p => p.id === id);
    document.getElementById("titulo").value = pelicula.title;
    document.getElementById("director").value = pelicula.director;
    document.getElementById("anio").value = pelicula.release_date;
    window.scrollTo({
        top: document.body.scrollHeight,
        behavior:"smooth"
    })

}

function buscar() {
    const texto = document.getElementById("busqueda").value.toLowerCase();
    const filtradas = peliculasGlobal.filter(p =>
        p.title.toLowerCase().includes(texto)
    );
    mostrarPeliculas(filtradas);
}

//Simular que se han guardado los datos
document.getElementById("formulario").addEventListener("submit", function(e){
    e.preventDefault();
    const datos = {
        titulo : document.getElementById("titulo").value,
        director : document.getElementById ("director").value,
        anio : document.getElementById("anio").value
    };
    console.log("Pelicula guardada", datos);
    alert("Pelicula guardada correctamente");
});

cargarPeliculas();