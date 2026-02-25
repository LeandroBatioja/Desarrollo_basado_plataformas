import 'package:flutter/material.dart';

class Layoutbuilder extends StatelessWidget {
  const Layoutbuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Ejemplo LayoutBuilder')),
      body: Center(
        child: LayoutBuilder(
          builder: (context, constraints) {
            if (constraints.maxHeight < 400) {
              return Container(
                color: Colors.blue,
                width: constraints.maxWidth,
                height: 100,
                child: const Center(
                  child: Text('Diseño Compacto'),
                ),
              );
            } else {
              return Container(
                color: Colors.green,
                width: constraints.maxWidth,
                height: 200,
                child: const Center(
                  child: Text('Diseño Expandido'),
                ),
              );
            }
          },
        ),
      ),
    );
  }
}