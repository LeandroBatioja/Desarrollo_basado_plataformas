import 'package:flutter/material.dart';

class ListaElementos extends StatelessWidget {
  const ListaElementos({super.key});

  @override
  Widget build(BuildContext context) {
    final List <String>frutas = ['Manzana', 
    'Banana', 
    'Naranja', 
    'Pera', 
    'Kiwi',
    'Fresa',
    'Melón',
    'Sandía',
    'Piña',
    'Mango',
    'Cereza',
    'Durazno',
    'Ciruela',
    'Uva'];


    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Lista de Frutas'),
          backgroundColor: Colors.teal,
        ),
        body: ListView.builder(
          itemCount: frutas.length,
          itemBuilder: (context, index) {
            return ListTile(
              leading: const Icon(Icons.local_grocery_store),
              title: Text('Fruta numero ${index + 1}'),
              trailing: const Icon(Icons.arrow_forward_ios, size:16 ),
              onTap: (){
                ScaffoldMessenger.of( context).showSnackBar(
                  SnackBar(content: Text('Seleccionaste ${frutas[index]}')),
                );
              }
            );
          },
        ),
      ),
    );
  }
}