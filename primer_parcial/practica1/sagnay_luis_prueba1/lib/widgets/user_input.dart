import 'package:flutter/material.dart';

class UserInput extends StatelessWidget {
  final TextEditingController controller;
  final String label;

  const UserInput({super.key, required this.controller, required this.label});

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
