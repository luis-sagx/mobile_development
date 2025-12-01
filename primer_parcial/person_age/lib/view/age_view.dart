import 'package:flutter/material.dart';
import '../controller/age_controller.dart';

// Atomos

class LabelText extends StatelessWidget {
  final String text;
  const LabelText({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
    );
  }
}

class NumberField extends StatelessWidget {
  final TextEditingController controller;
  final String hint;

  const NumberField({super.key, required this.controller, required this.hint});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(hintText: hint, border: OutlineInputBorder()),
    );
  }
}

class PrimaryButton extends StatelessWidget {
  final String text;

  final VoidCallback onPressed;

  const PrimaryButton({super.key, required this.onPressed, required this.text});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(onPressed: onPressed, child: Text(text));
  }
}

class ResultText extends StatelessWidget {
  final String text;
  const ResultText({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(text, style: TextStyle(fontSize: 16));
  }
}

// molecula

class DateInput extends StatelessWidget {
  final TextEditingController day, month, year;

  const DateInput({
    super.key,
    required this.day,
    required this.month,
    required this.year,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: NumberField(controller: day, hint: "Enter day"),
        ),
        SizedBox(width: 12),
        Expanded(
          child: NumberField(controller: month, hint: "Enter month"),
        ),
        SizedBox(width: 12),
        Expanded(
          child: NumberField(controller: year, hint: "Enter year"),
        ),
        SizedBox(width: 12),
      ],
    );
  }
}

//organismos

class AgeCard extends StatefulWidget {
  const AgeCard({super.key});

  @override
  State<AgeCard> createState() => _AgeCardState();
}

class _AgeCardState extends State<AgeCard> {
  final _ctrlDia = TextEditingController();
  final _ctrlMes = TextEditingController();
  final _ctrlAnio = TextEditingController();
  final _controller = AgeController();
  String _resultado = '';

  void _calcular() {
    setState(() {
      _resultado = _controller.processAgeInput(
        _ctrlDia.text,
        _ctrlMes.text,
        _ctrlAnio.text,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 16),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const LabelText(text: 'Enter your date of birth'),
            const SizedBox(height: 8),
            DateInput(day: _ctrlDia, month: _ctrlMes, year: _ctrlAnio),
            const SizedBox(height: 12),
            PrimaryButton(text: 'Calculate age', onPressed: _calcular),
            const SizedBox(height: 12),
            ResultText(text: _resultado),
          ],
        ),
      ),
    );
  }
}

class AgePage extends StatelessWidget {
  const AgePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Calcular Edad (MVC + Atomic)')),
      body: const Padding(padding: EdgeInsets.all(16), child: AgeCard()),
    );
  }
}
