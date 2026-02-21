import 'dart:io';

class Auto{
  String? marca, modelo;
  int? anio;

  //Getters - buscara el valor y lo mandara al usuario y si no hay nada va a colocar que no esta definido
  String DimeDatos(){
    return '''Marca: $marca
              Modelo: $modelo
              Año: $anio''';
  }

  //Setters - con este metodo nos aseguramos de que le dimos un valor a marca y si se lo dimos
  //lo pondra en marca
  void PideDatos(){
    print('Dime marca del vehiculo...');
    marca = stdin.readLineSync()!;
    print('Dime modelo del vehiculo...');
    modelo = stdin.readLineSync()!;
    print('Dime año del vehiculo...');
    anio = int.parse(stdin.readLineSync()!);
  }
}

void main(){ 
  Auto auto1 = Auto();
  auto1.PideDatos();
  print(auto1.DimeDatos());
}