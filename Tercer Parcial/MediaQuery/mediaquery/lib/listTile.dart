import 'package:flutter/material.dart';

class Listtile extends StatelessWidget {
  const Listtile({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Ejemplo de ListTile'),
        ),
        body: ListView(
          children: [
            ListTile(
              leading: const Icon(Icons.person),
              title: const Text('Primer elemento'),
              subtitle: const Text('Subtítulo del primer elemento'),
              trailing: const Icon(Icons.arrow_forward_ios),
            ),
            ListTile(
              leading: const Icon(Icons.email),
              subtitle: const Text('Ingrese su correo Electrónico'),
              trailing: const Icon(Icons.arrow_forward_ios),

            ),
          ],
        ),
      ),
    );
  }
}