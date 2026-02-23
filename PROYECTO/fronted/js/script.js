const URL = "https://ghibliapi.vercel.app/films";
let peliculasGlobal = [];

// 1. CARGAR DESDE LA API DE GHIBLI
async function cargarPeliculas() {
    try {
        const respuesta = await fetch(URL);
        peliculasGlobal = await respuesta.json();
        mostrarPeliculas(peliculasGlobal);
    } catch (error) {
        console.error("Error cargando API de Ghibli:", error);
    }
}

// 2. RENDERIZAR TARJETAS
function mostrarPeliculas(peliculas) {
    const contenedor = document.getElementById("contenedor");
    const contador = document.getElementById("contador");

    contenedor.innerHTML = "";
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

// 3. SELECCIONAR PARA EL FORMULARIO
function seleccionar(id) {
    const pelicula = peliculasGlobal.find(p => p.id === id);
    document.getElementById("titulo").value = pelicula.title;
    document.getElementById("director").value = pelicula.director;
    document.getElementById("anio").value = pelicula.release_date;
    
    window.scrollTo({
        top: document.body.scrollHeight,
        behavior: "smooth"
    });
}

// 4. BUSCADOR
function buscar() {
    const texto = document.getElementById("busqueda").value.toLowerCase();
    const filtradas = peliculasGlobal.filter(p =>
        p.title.toLowerCase().includes(texto)
    );
    mostrarPeliculas(filtradas);
}

// 5. GUARDAR EN TU MONGO ATLAS (A través del backend)
document.getElementById("formulario").addEventListener("submit", async function(e) {
    e.preventDefault();

    const datos = {
        titulo: document.getElementById("titulo").value,
        director: document.getElementById("director").value,
        anio: document.getElementById("anio").value
    };

    try {
        const respuesta = await fetch("http://localhost:3000/api/peliculas", {
            method: "POST",
            headers: { "Content-Type": "application/json" },
            body: JSON.stringify(datos)
        });

        if (respuesta.ok) {
            alert("✅ ¡Guardada en MongoDB Atlas!");
            this.reset();
        } else {
            alert("❌ Error en el servidor");
        }
    } catch (error) {
        alert("❌ El servidor backend está apagado. (Ejecuta 'node server.js')");
    }
});

cargarPeliculas();