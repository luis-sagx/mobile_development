import '../models/number_model.dart';

class NumberController {
  String checkAbundantNumber(String numberStr) {
    if (numberStr.isEmpty) {
      return 'Por favor ingrese un número.';
    }

    int? number = int.tryParse(numberStr);

    if (number == null) {
      return 'Por favor ingrese un número entero válido.';
    }

    if (number <= 0) {
      return 'Por favor ingrese un número entero positivo.';
    }

    final NumberModel numberModel = NumberModel(number: number);

    List<int> divisors = numberModel.getProperDivisors();

    int sum = numberModel.getSumOfProperDivisors();

    bool isAbundant = numberModel.isAbundant();

    String result = 'Número: $number\n\n';
    result += 'Divisores propios: $divisors\n\n';
    result += 'Suma de divisores: $sum\n\n';

    if (isAbundant) {
      result += 'El número $number si es abundante\n';
      result += 'porque $sum es mayor que $number';
    } else {
      result += 'El número $number no es abundante\n';
      result += 'porque $sum es menor o igual que $number';
    }

    return result;
  }
}
