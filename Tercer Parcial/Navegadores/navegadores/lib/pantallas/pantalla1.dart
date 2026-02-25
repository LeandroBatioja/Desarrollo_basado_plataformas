
import 'package:flutter/material.dart';
import 'pantalla2.dart';
class Pantalla1 extends StatelessWidget {
  const Pantalla1({super.key});

  @override
  Widget build(BuildContext context) {

    const String mensaje = '¡Bienvenido a la Pantalla 1!';


    return Scaffold(
      appBar: AppBar(
        title: const Text('Pantalla 1'),
      ),
      body: Center(
        child: ElevatedButton(
          child: const Text('Ir a Pantalla 2'),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const Pantalla2(
                datorecibido: mensaje,
              )),
            );
          },
        ),
      ),
    );
  }
}