import 'package:flutter/material.dart';
import '../widget/calculate_button.dart';
import '../widget/calculate_input.dart';
import '../controllers/seller_controller.dart';

class SellsView extends StatefulWidget {
  const SellsView({super.key});

  @override
  State<SellsView> createState() => _SellsViewState();
}

class _SellsViewState extends State<SellsView> {
  final controller = SellerController();
  final sell1Controller = TextEditingController();
  final sell2Controller = TextEditingController();
  final sell3Controller = TextEditingController();

  void _calculate() {
    final result = controller.getSalary(
      sell1Controller.text,
      sell2Controller.text,
      sell3Controller.text,
    );

    Navigator.pushNamed(context, '/result', arguments: result);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Seller Salary Calculator')),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            InputSell(controller: sell1Controller, label: 'Sell 1'),
            SizedBox(height: 12),
            InputSell(controller: sell2Controller, label: 'Sell 2'),
            SizedBox(height: 12),
            InputSell(controller: sell3Controller, label: 'Sell 3'),
            SizedBox(height: 12),
            CalculateButton(onPressed: _calculate, text: 'Calculate'),
          ],
        ),
      ),
    );
  }
}
