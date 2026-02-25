import 'package:flutter/material.dart';

//import 'layoutbuilder.dart';
//import 'GridView.dart';
import 'Scrolls.dart';
//import 'card.dart';
//import 'listTile.dart';
//import 'listView.dart';
//import 'reponsivos.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    
    final tamanio= MediaQuery.of(context).size;
    final ancho = tamanio.width;
    final alto = tamanio.height;
    
    
    
    
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      home: Scrolls(),
    );
  }
}