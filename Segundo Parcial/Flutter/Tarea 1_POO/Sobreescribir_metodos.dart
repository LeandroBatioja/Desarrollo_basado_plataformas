class Vehiculo{
  void combustible(){
    print ('Combustible generico del vehiculo');
  }
}

class Carro extends Vehiculo{
  @override
  void combustible(){
    print('Gasolina');
  }
}

class Moto extends Vehiculo{
  void combustible(){
    print('Electrica');
  }
}

void main(){
  var vehiculo1 = Vehiculo();
  vehiculo1.combustible();
  var vehiculo2 = Carro();
  vehiculo2.combustible();
  var vehiculo3 = Moto();
  vehiculo3.combustible();
  
}