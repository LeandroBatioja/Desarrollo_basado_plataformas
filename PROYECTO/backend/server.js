const express = require('express');
const mongoose = require('mongoose');
const cors = require('cors');

const app = express();
app.use(express.json());
app.use(cors());


const MONGO_URI = "mongodb+srv://leo:leo@ghinlistudio.7wvcf95.mongodb.net/GhibliStudio?retryWrites=true&w=majority";

mongoose.connect(MONGO_URI)
    .then(() => console.log("✅ Conexión exitosa a MongoDB Atlas (GhinliStudio)"))
    .catch(err => console.error("❌ Error de conexión:", err));

// --- MODELO ---
const Pelicula = mongoose.model('Pelicula', {
    titulo: String,
    director: String,
    anio: String
});

// --- RUTA POST ---
app.post('/api/peliculas', async (req, res) => {
    try {
        const nuevaPelicula = new Pelicula(req.body);
        await nuevaPelicula.save();
        res.status(201).json({ mensaje: "¡Guardada en la nube!" });
    } catch (error) {
        res.status(500).json({ error: "Error al guardar" });
    }
});

app.listen(3000, () => console.log("🚀 Servidor corriendo en http://localhost:3000"));