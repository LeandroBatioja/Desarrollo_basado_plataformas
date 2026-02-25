import 'package:ejerciciosflutter/presentacion/pantallas/ingresotexto.dart';
import 'package:flutter/material.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, //Quitar el banner de debug
      theme: ThemeData(
        useMaterial3: false,
        colorSchemeSeed: Colors.deepPurple
        ), //Usar el tema de Material 3
      home: const Ingresotexto()
    );
  }
}