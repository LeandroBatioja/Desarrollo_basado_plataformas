import 'dart:io';

void main(){
  try{
    print('Ingrese valor 1...');
    int? valor1 = int.parse(stdin.readLineSync()!); 

    print('Ingrese valor 2...');
    int? valor2 = int.parse(stdin.readLineSync()!);

    int resultado = valor1 ~/ valor2;
    print('Resultado: $resultado');

  }on FormatException{
    print('Ingresar un valor entero');
  }on IntegerDivisionByZeroException{
    print('Division entre cero no permitida');
  }catch(error){
    print('Error en operacion: $error');
  }

}