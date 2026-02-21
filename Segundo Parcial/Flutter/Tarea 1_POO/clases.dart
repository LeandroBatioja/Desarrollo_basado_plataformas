class Persona{
  String? nombre, apellido;
  int? edad;

  //Crear Metodo
  void Dimedatos(){
    //Nomas se ejecutara el nombre
    //print('Nombre: $nombre');

    //Se ejecuta con el los dos atributos de la clase Persona
    print('Nombre: $nombre $apellido' 
          ' Edad: $edad');
  }
}

class Animal{
  String? nombre, raza;
  double? tamanio;
  bool? desparasitado, vacunado;

  //Metodo
  void DimeDatos(){
    print('''Nombre: $nombre
          Raza: $raza
          Tamaño: $tamanio cm
          Desparacitado: $desparasitado
          Vacunado: $vacunado''');
  }
}

void main() {
  //Primer objeto de la clase persona
  Persona persona1 = Persona();
  Persona persona2 = Persona();

  persona1.nombre = 'Jose';
  persona1.apellido = 'Feliciano';
  persona1.edad = 50;
  persona1.Dimedatos();

  //Mismos atributos de la clase persona pero para otro objeto 
  persona2.nombre = 'Jeffrey';
  persona2.apellido = 'Epstein';
  persona2.edad = 66;
  persona2.Dimedatos();
  //En caso de que el el atributo "nombre" no tuviera ningun valor, aparecera como null

  //Objetos de la clase Animal
  Animal perro1 = Animal();
  perro1.nombre = 'Balto';
  perro1.raza = 'Husky Siberiano';
  perro1.tamanio = 50;
  perro1.vacunado = true;
  perro1.desparasitado = true;
  perro1.DimeDatos();

}