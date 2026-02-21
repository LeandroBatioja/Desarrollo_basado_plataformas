class Persona{
  //String? nombre;
  //int? edad;

  String? v_nombre;
  int? v_edad;

  //Metodo Constructor
  /*Persona(String nombre, int edad){
    this.nombre = nombre;
    this.edad = edad;
  }*/

  Persona(String nombre, int edad){
    v_nombre = nombre;
    v_edad = edad;
  }

}


void main(){
  Persona objeto1 = Persona('Jose', 60);
  print(objeto1.v_nombre);
  print(objeto1.v_edad);
  
}