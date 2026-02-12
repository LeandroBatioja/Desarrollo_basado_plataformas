const URL = "https://ghibliapi.vercel.app/films";
let peliculasGlobal = [];

async function cargarPeliculas() {
        const respuesta = await fetch(URL);
        peliculasGlobal = await respuesta.json();
        mostrarPeliculas(peliculasGlobal);

}

function mostrarPeliculas(peliculas) {
    const contenedor = document.getElementById("contenedor");
    contenedor.innerHTML = "";

    peliculas.forEach(pelicula => {
        contenedor.innerHTML += `
            <div class="card" onclick="seleccionar('${pelicula.id}')">
                <img src="${pelicula.image}" alt="${pelicula.title}">
                <div class="card-content">
                    <h3>${pelicula.title}</h3>
                    <p>Director: ${pelicula.director}</p>
                    <p>Año: ${pelicula.release_date}</p> 
                </div>
            </div>
        `;
    });
}

function seleccionar(id) {
    const pelicula = peliculasGlobal.find(p => p.id === id);
    if (pelicula) {
        document.getElementById("titulo").value = pelicula.title;
        document.getElementById("director").value = pelicula.director;
        document.getElementById("anio").value = pelicula.release_date;
    }
}

function buscar() {
    const texto = document.getElementById("busqueda").value.toLowerCase();
    const filtradas = peliculasGlobal.filter(p =>
        p.title.toLowerCase().includes(texto)
    );
    mostrarPeliculas(filtradas);
}

cargarPeliculas();