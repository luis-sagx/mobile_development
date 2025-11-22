import "dart:io";

void main() {

  stdout.write("Ingrese su edad: ");
  int age = int.parse(stdin.readLineSync()!);
  String message = "";
  final List<int> precio = [10,15,20,0];
  if(age < 0){
    print("Error de edad");
    return;
  } else if (age >= 15) {
    message = "Debe pagar \$${precio[0]}";
  } else if (age <= 21 && age > 15) {
    message = "Debe pagar \$${precio[1]}";
  } else if (age <= 50 && age > 21) {
    message = "Debe pagar \$${precio[2]}";
  } else if (age > 50 ) {
    message = "Debe pagar \$${precio[0]}, es GRATIS";
  }
  
  print("${message}");

}
