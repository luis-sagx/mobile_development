class SellerModel {
  final double sell1;
  final double sell2;
  final double sell3;
  final int baseSalary = 36500;

  SellerModel({required this.sell1, required this.sell2, required this.sell3});

  double getTotalSales() => sell1 + sell2 + sell3;

  double getSalary() {
    double commission = getTotalSales() * 0.12;
    return baseSalary + commission;
  }

  double getTaxes() {
    return getTotalSales() * 0.15;
  }

  double getDiscount() {
    double total = getTotalSales();
    if (total > 2000) {
      return getTotalSales() * 0.20;
    }
    return 0;
  }
}
