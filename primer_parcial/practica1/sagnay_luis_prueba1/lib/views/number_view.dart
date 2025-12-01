import 'package:flutter/material.dart';
import 'package:sagnay_luis_prueba1/widgets/calculate_button.dart';
import '../controllers/number_controller.dart';
import '../widgets/user_input.dart';

class NumberView extends StatefulWidget {
  const NumberView({super.key});

  @override
  State<NumberView> createState() => _NumberViewState();
}

class _NumberViewState extends State<NumberView> {
  final TextEditingController _numberController = TextEditingController();
  final NumberController _controller = NumberController();

  void _calculate() {
    String result = _controller.checkAbundantNumber(_numberController.text);

    Navigator.pushNamed(context, '/result', arguments: result);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Número Abundante'),
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Verificador de Números Abundantes',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            UserInput(
              controller: _numberController,
              label: 'Número entero positivo',
            ),
            const SizedBox(height: 30),
            CalculateButton(onPressed: _calculate, text: 'Calcular'),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
