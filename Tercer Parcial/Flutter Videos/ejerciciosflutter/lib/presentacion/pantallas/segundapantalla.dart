import 'package:flutter/material.dart';

class PantallaPrincipal extends StatefulWidget {
  
  const PantallaPrincipal({super.key});

  @override
  State<PantallaPrincipal> createState() => _PantallaPrincipalState();
}

class _PantallaPrincipalState extends State<PantallaPrincipal> {

  int cantidadClicks = 0;

  void incrementar(){
    setState(() {
      cantidadClicks++;
    });
  }

  void decrementar(){
    setState(() {
      cantidadClicks--;
    });
  }

  void reiniciar(){
    setState(() {
      cantidadClicks = 0;
    });
  }


  @override
  Widget build(BuildContext context){
    return  Scaffold(
      appBar: AppBar(title: const Text('Pantalla Principal'),
      leading: IconButton(
        onPressed: reiniciar,
          icon: Icon(Icons.refresh_rounded),),
      ),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('$cantidadClicks', 
            style: TextStyle(fontSize: 100, fontFamily: 'Verdana', fontWeight: FontWeight.w100),),

            const Text('Cantidad de clicks', style: TextStyle(fontSize: 30, fontFamily: 'Verdana', fontWeight: FontWeight.w100),)
          ],
        ),
      ),

      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FloatingActionButton(
            onPressed: incrementar, 
          child: const Icon(Icons.plus_one),
          ),
          const SizedBox(width: 10,),
          FloatingActionButton(onPressed: decrementar,
          child: const Icon(Icons.exposure_minus_1),
          ),
        ],
      ),
    );
  }
}