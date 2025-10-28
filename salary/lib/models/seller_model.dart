class SellerModel {
  final double sell1;
  final double sell2;
  final double sell3;

  SellerModel({required this.sell1, required this.sell2, required this.sell3});

  double getTaxes() {
    double sellWithTaxes = (sell1 + sell2 + sell3) * 0.15;
    return sellWithTaxes;
  }

  double getDiscount() {
    double sellWithDiscount = (sell1 + sell2 + sell3) * 0.10;
    return sellWithDiscount;
  }

  double getSalary() {
    double sellTotals = sell1 + sell2 + sell3;
    int baseSalary = 36500;
    double commission = sellTotals * 0.12;
    return baseSalary + commission;
  }
}
