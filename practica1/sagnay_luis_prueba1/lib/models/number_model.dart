class NumberModel {
  final int number;

  NumberModel({required this.number});

  List<int> getProperDivisors() {
    List<int> divisors = [];

    for (int i = 1; i <= number ~/ 2; i++) {
      if (number % i == 0) {
        divisors.add(i);
      }
    }

    return divisors;
  }

  int getSumOfProperDivisors() {
    List<int> divisors = getProperDivisors();
    int sum = 0;

    for (int divisor in divisors) {
      sum += divisor;
    }

    return sum;
  }

  bool isAbundant() {
    int sum = getSumOfProperDivisors();
    return sum > number;
  }
}
