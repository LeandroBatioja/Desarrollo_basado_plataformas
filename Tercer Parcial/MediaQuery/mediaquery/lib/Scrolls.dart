import 'package:flutter/material.dart';

class Scrolls extends StatelessWidget {
  const Scrolls({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> libros = [
      {'titulo': 'Cien años de soledad', 'autor': 'Gabriel García Márquez'},
      {'titulo': 'Don Quijote de la Mancha', 'autor': 'Miguel de Cervantes'},
      {'titulo': 'El principito', 'autor': 'Antoine de Saint-Exupéry'},
      {'titulo': '1984', 'autor': 'George Orwell'},
      {'titulo': 'La sombra del viento', 'autor': 'Carlos Ruiz Zafón'},
      {'titulo': 'Rayuela', 'autor': 'Julio Cortázar'},
      {'titulo': 'Crimen y castigo', 'autor': 'Fiódor Dostoyevski'},
      {'titulo': 'Orgullo y prejuicio', 'autor': 'Jane Austen'},
      {'titulo': 'Los juegos del hambre', 'autor': 'Suzanne Collins'},
      {'titulo': 'Harry Potter y la piedra filosofal', 'autor': 'J.K. Rowling'},
    ];
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: false,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('El rincon del Vago'),
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Card(
                elevation: 4,
                margin: const EdgeInsets.only(bottom: 16),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: const [
                          Icon(Icons.campaign, color: Colors.blue, size: 24),
                          SizedBox(width: 8),
                          Text(
                            'Informacion importante',
                            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      const Text('''Tenemos grandes Noticias!.
                      Pronto prodras comprar todos tus libros desde nuestra aplicacion.
                      Mantente a nuestra proxima aplicacion'''),
                    ],
                  ),
                ),
              ), 
              Card(
                elevation: 4,
                margin: const EdgeInsets.only(bottom: 16),
                child: SizedBox(
                  height: 300,
                  child: ListView.builder(
                    itemCount: libros.length,
                    itemBuilder: (context, index) {
                      final libro = libros[index];
                      return ListTile(
                        leading: const Icon(Icons.book, color: Colors.green),
                        title: Text(libro['titulo']!),
                        subtitle: Text('Autor: ${libro['autor']}'),
                      );
                    },
                  ),
                ),
              ),
              Card(
                elevation: 4,
                margin: const EdgeInsets.only(bottom: 16),
                child: SizedBox(
                  height: 250,
                  child: GridView.count(
                    crossAxisCount: 3,
                    crossAxisSpacing: 8,
                    mainAxisSpacing: 8,
                    children: List.generate(
                      9,
                      (index)=>Container(
                        color: Colors.primaries[index % Colors.primaries.length],
                        child: const Center(
                          child: Text('Imagen de Libro', 
                          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                          ),
                        )
                      )
                    ),
                  )
               )
              ),
              const Text(
                'Desplazate hacia arriba o abajo para ver todo el contenido',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16, fontStyle: FontStyle.italic),
              )
            ], 
          ), 
        ), 
      ),
    );
  }
}