import 'package:flutter/material.dart';

class Ingresotexto extends StatefulWidget {
  const Ingresotexto({super.key});

  @override
  State<Ingresotexto> createState() => _IngresotextoState();
} 

class _IngresotextoState extends State<Ingresotexto> {
  final TextEditingController _controller = TextEditingController();
  final _llaveFormulario = GlobalKey<FormState>();
  
  String textomostrado = '';
  String? opcionSeleccionada;
  bool usuarioActivo = false;

  bool opcion1 = false;
  bool opcion2 = false;
  bool opcion3 = false;

  String?nivelExperiencia; // Variable para almacenar la opción seleccionada en los RadioButtons


  final List<String> paises = [
    'México', 
    'Colombia', 
    'Argentina', 
    'Perú', 
    'Chile',
    'Argentina',
    'Ecuador'
    ];




  void muestrarTexto() {
    if (_llaveFormulario.currentState!.validate()) {
      setState(() {
        //===Concatenacion ====
        List<String> lenguajes = [];
        if (opcion1) lenguajes.add('Dart');
        if (opcion2) lenguajes.add('Python');
        if (opcion3) lenguajes.add('JavaScript');

        textomostrado = '''${_controller.text}\nPais: $opcionSeleccionada\n
        Usuario activo: ${usuarioActivo ? 'Activo' : 'Inactivo'}
        Lenguaje Seleccionado: ${lenguajes.isEmpty ? 'Ninguno' : lenguajes.join(', ')}''';
      });
    }
  }

  void limpiarTexto() {
    setState(() {
      textomostrado = '';
      _controller.clear();
      opcionSeleccionada = null; // Limpiar la selección del DropdownButton
      usuarioActivo = false; // Reiniciar el estado del Switch
      opcion1 = false; // Reiniciar el estado de las Checkboxes
      opcion2 = false;
      opcion3 = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Registro de nombre')),
      body: SingleChildScrollView( // Se añade para permitir el desplazamiento
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            key: _llaveFormulario,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //=================Campo de texto=================
                TextFormField(
                  controller: _controller,
                  decoration: const InputDecoration(
                    labelText: 'Ingrese texto....',
                    border: OutlineInputBorder(),
                  ),
                  // CORRECCIÓN: Agregado el paréntesis (value)
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor ingrese un texto';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                
                //=================DropdownButton=================
                DropdownButtonFormField<String>(
                  value: opcionSeleccionada,
                  items: paises.map((String pais) {
                    return DropdownMenuItem<String>(
                      value: pais,
                      child: Text(pais),
                    );
                  }).toList(),
                  onChanged: (String? nuevoValor) {
                    setState(() {
                      opcionSeleccionada = nuevoValor;
                    });
                  },
                  decoration: const InputDecoration(
                    labelText: 'Seleccione un país',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor seleccione un país';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                
                //=================Switch================
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Uusuario activo', style: TextStyle(fontSize: 16),),
                    Switch(
                      value: usuarioActivo,
                      onChanged: (bool valor) {
                        setState(() {
                          usuarioActivo = valor;
                        });
                      },
                    ),
                  ],
                ),
                const SizedBox(height: 30),

                //====RadioButtons====
                const Text('Nivel de experiencia:', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
                RadioListTile<String>(
                  title: const Text('Junior'),
                  value: 'Junior',  
                  groupValue: nivelExperiencia,
                  onChanged: (String? valor) {
                    setState(() {
                      nivelExperiencia = valor;
                    });
                  },
                ),
                RadioListTile<String>(
                  title: const Text('Senior'),
                  value: 'Senior',
                  groupValue: nivelExperiencia,
                  onChanged: (String? valor) {
                    setState(() {
                      nivelExperiencia = valor;
                    });
                  },
                ),
                const SizedBox(height: 30),

                //=================Checkboxes=================
                const Text('Lenguajes de programación:', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
                CheckboxListTile(
                  title: const Text('Dart'),
                  value: opcion1,
                  onChanged: (bool? valor) {
                    setState(() {
                      opcion1 = valor ?? false;
                    });
                  },
                ),
                CheckboxListTile(
                  title: const Text('Python'),
                  value: opcion2,
                  onChanged: (bool? valor) {
                    setState(() {
                      opcion2 = valor ?? false;
                    });
                  },
                ),
                CheckboxListTile(
                  title: const Text('JavaScript'),
                  value: opcion3,
                  onChanged: (bool? valor) {
                    setState(() {
                      opcion3 = valor ?? false;
                    });
                  },
                ),
                const SizedBox(height: 20),
                
                //=================Botones================
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                        onPressed: muestrarTexto,
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue,
                            foregroundColor: Colors.white), // Texto en blanco para leer mejor
                        child: const Text('Mostrar')),
                    ElevatedButton(
                        onPressed: limpiarTexto,
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.red,
                            foregroundColor: Colors.white),
                        child: const Text('Limpiar')),
                  ],
                ),
                const SizedBox(height: 20),
                Text(
                  textomostrado.isEmpty
                      ? 'Mostrar: muestra texto.\nLimpiar: Limpia el texto colocado'
                      : 'texto ingresado: $textomostrado',
                  style: const TextStyle(fontSize: 18),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}