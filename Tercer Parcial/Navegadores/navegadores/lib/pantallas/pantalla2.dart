import 'package:flutter/material.dart';

class Pantalla2 extends StatelessWidget {
  // Se quita el '' para que el constructor realmente asigne el valor recibido
  final String datorecibido; 
  const Pantalla2({super.key, required this.datorecibido});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pantalla 2'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              datorecibido,
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              child: const Text('Volver a la pantalla 1'),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ], //   
        ), // 
      ), // 
    );
  }
}