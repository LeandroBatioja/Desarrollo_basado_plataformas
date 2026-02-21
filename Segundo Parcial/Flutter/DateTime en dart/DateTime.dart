//Metodo Principal

void main(){
  //Fecha del dia de hoy
  DateTime ahora = DateTime.now();
  print(ahora);

  //Con esto extraemos el año
  print('Año: ${ahora.year}');
  print('Mes: ${ahora.month}');
  print('Día: ${ahora.day}');
  print('Hora: ${ahora.hour}');
  print('Minutos: ${ahora.minute}');
  print('Segundos: ${ahora.second}');

  //Operaciones con fechas
  print('==========================================\n');
  print(ahora.add(Duration(days: 10)));
  print(ahora.subtract(Duration(days: 8)));


  print('==========================================\n');
  //Comparar fechas
  DateTime fechaIngreso = DateTime(2025, 1, 17);
  DateTime FechaCancelacion = DateTime(2025, 9, 17);

  print(fechaIngreso.isBefore(FechaCancelacion));
  print(fechaIngreso.isAfter(FechaCancelacion)); //Este es para antes
  print(fechaIngreso.isAtSameMomentAs(FechaCancelacion));


  print('==========================================\n');
  //Fecha especifica
  DateTime cumple = DateTime(1995, 5, 20);
  print(cumple);
}