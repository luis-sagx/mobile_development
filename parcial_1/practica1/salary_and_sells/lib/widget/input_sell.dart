import 'package:flutter/material.dart';

class InputSell extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  const InputSell({super.key, required this.controller, required this.label});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        labelText: label,
        border: const OutlineInputBorder(),
      ),
    );
  }
}
