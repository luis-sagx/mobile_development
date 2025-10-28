import 'package:flutter/material.dart';
import 'package:salary_and_sells/controllers/seller_controller.dart';

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
            TextField(
              controller: sell1Controller,
              decoration: const InputDecoration(
                labelText: 'Enter first month sell',
              ),
            ),
            TextField(
              controller: sell2Controller,
              decoration: const InputDecoration(
                labelText: 'Enter second month sell',
              ),
            ),
            TextField(
              controller: sell3Controller,
              decoration: const InputDecoration(
                labelText: 'Enter third month sell',
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _calculate,
              child: const Text('Calculate Salary'),
            ),
          ],
        ),
      ),
    );
  }
}
