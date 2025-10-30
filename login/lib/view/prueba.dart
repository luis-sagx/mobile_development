import 'package:flutter/material.dart';

class Prueba extends StatelessWidget {
  const Prueba({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Prueba Theme')),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Text('Texto de prueba titulo'),
              Text('Texto de prueba label'),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {},
                child: const Text('Botón primario'),
              ),
              const SizedBox(height: 12),
              OutlinedButton(
                onPressed: () {},
                child: const Text('Botón secundario'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
