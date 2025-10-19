import 'package:flutter/material.dart';

class CalculateMetricPage extends StatefulWidget {
  const CalculateMetricPage({super.key});

  @override
  State<CalculateMetricPage> createState() => _CalculateMetricPageState();
}

class _CalculateMetricPageState extends State<CalculateMetricPage> {
  final baseController = TextEditingController();
  final heightController = TextEditingController();

  double area = 0;
  double perimeter = 0;
  double value = 0;

  void calculate() {
    final base = double.tryParse(baseController.text) ?? 0;
    final height = double.tryParse(heightController.text) ?? 0;

    setState(() {
      area = base * height;
      perimeter = 2 * (base + height);
      value = area * 500;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Metric Calculator'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: baseController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Base',
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: heightController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Height',
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: calculate,
              child: const Text('Calculate'),
            ),
            const SizedBox(height: 20),
            Text('Area: $area'),
            Text('Perimeter: $perimeter'),
            Text('Value: $value'),
          ],
        ),
      ),
    );
  }
}
