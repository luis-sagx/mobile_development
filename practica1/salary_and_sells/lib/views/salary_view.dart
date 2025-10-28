import 'package:flutter/material.dart';

class SalaryView extends StatelessWidget {
  const SalaryView({super.key});

  @override
  Widget build(BuildContext context) {
    final result =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;

    if (result.containsKey('error')) {
      return Scaffold(
        appBar: AppBar(title: const Text('Result')),
        body: Center(
          child: Text(result['error'], style: const TextStyle(fontSize: 20)),
        ),
      );
    }

    double salary = result['salary'];
    Map<String, double> invoice = Map<String, double>.from(result['invoice']);

    return Scaffold(
      appBar: AppBar(title: const Text('Calculation Result')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Sueldo del Vendedor: \$${salary.toStringAsFixed(2)}',
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),

            Card(
              elevation: 4,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'FACTURA DE VENTA',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Divider(),
                    Text(
                      'Ventas totales: \$${invoice['totalSales']!.toStringAsFixed(2)}',
                    ),
                    Text(
                      'IVA (15%): \$${invoice['taxes']!.toStringAsFixed(2)}',
                    ),
                    Text(
                      'Descuento (20% si > 2000): \$${invoice['discount']!.toStringAsFixed(2)}',
                    ),
                    const Divider(),
                    Text(
                      'Total a Pagar: \$${invoice['totalInvoice']!.toStringAsFixed(2)}',
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
