import 'package:flutter/material.dart';
import 'package:salary_and_sells/controllers/seller_controller.dart';
import 'package:salary_and_sells/widget/calculate_button.dart';
import 'package:salary_and_sells/widget/input_sell.dart';

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
      appBar: AppBar(title: const Text('Seller salary calculator')),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            InputSell(
              controller: sell1Controller,
              label: 'Enter first month sell',
            ),
            const SizedBox(height: 10),
            InputSell(
              controller: sell2Controller,
              label: 'Enter second month sell',
            ),
            const SizedBox(height: 10),
            InputSell(
              controller: sell3Controller,
              label: 'Enter third month sell',
            ),
            const SizedBox(height: 20),
            CalculateButton(text: 'Calculate', onPressed: _calculate),
          ],
        ),
      ),
    );
  }
}
