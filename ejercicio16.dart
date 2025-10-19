import "dart:io";

void main() {

  stdout.write("Ingrese el numero de kilometros: ");
  double kilometer = double.parse(stdin.readLineSync()!);
  stdout.write("Ingrese el precio de de los litros: ");
  double liter = double.parse(stdin.readLineSync()!);
  stdout.write("Ingrese el precio de del peaje: ");
  double peaje = double.parse(stdin.readLineSync()!);

  double gasto = 0.0;
  
  gasto = getConsumption(kilometer, liter, peaje);

  print("Gasto: ${gasto.toStringAsFixed(2)}");

}


double getConsumption(double kilometer, double liter, double peaje){
  double gasto = (kilometer/13) * liter + 2 * peaje;
  if(kilometer > 400) gasto + 50;
  return gasto;
}