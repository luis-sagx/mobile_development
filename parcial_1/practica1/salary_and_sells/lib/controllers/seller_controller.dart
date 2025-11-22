import '../models/seller_model.dart';

class SellerController {
  Map<String, dynamic> getSalary(
    String sell1Str,
    String sell2Str,
    String sell3Str,
  ) {
    if (sell1Str.isEmpty || sell2Str.isEmpty || sell3Str.isEmpty) {
      return {'error': 'Please enter all sales amounts'};
    }

    double sell1 = double.tryParse(sell1Str) ?? 0;
    double sell2 = double.tryParse(sell2Str) ?? 0;
    double sell3 = double.tryParse(sell3Str) ?? 0;

    final SellerModel seller = SellerModel(
      sell1: sell1,
      sell2: sell2,
      sell3: sell3,
    );

    double totalSales = seller.getTotalSales();
    double taxes = seller.getTaxes();
    double discount = seller.getDiscount();
    double salary = seller.getSalary();

    return {
      'salary': salary,
      'invoice': {
        'totalSales': totalSales,
        'taxes': taxes,
        'discount': discount,
        'totalInvoice': totalSales + taxes - discount,
      },
    };
  }
}
