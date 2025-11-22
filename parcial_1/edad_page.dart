import 'package:flutter/material.dart';
import '../controller/edad_controller.dart';

/// 🔹 Átomos
class LabelText extends StatelessWidget {
  final String text;
  const LabelText(this.text, {super.key});
  @override
  Widget build(BuildContext context) =>
      Text(text, style: const TextStyle(fontWeight: FontWeight.bold));
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
      decoration: InputDecoration(
        hintText: hint,
        border: const OutlineInputBorder(),
      ),
    );
  }
}

class PrimaryButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  const PrimaryButton({super.key, required this.text, required this.onPressed});
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(onPressed: onPressed, child: Text(text));
  }
}

class ResultText extends StatelessWidget {
  final String text;
  const ResultText(this.text, {super.key});
  @override
  Widget build(BuildContext context) =>
      Text(text, style: const TextStyle(fontSize: 16));
}

/// 🔹 Molécula
class FechaInput extends StatelessWidget {
  final TextEditingController dia, mes, anio;
  const FechaInput({super.key, required this.dia, required this.mes, required this.anio});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(child: NumberField(controller: dia, hint: 'Día')),
        const SizedBox(width: 8),
        Expanded(child: NumberField(controller: mes, hint: 'Mes')),
        const SizedBox(width: 8),
        Expanded(child: NumberField(controller: anio, hint: 'Año')),
      ],
    );
  }
}

/// 🔹 Organismo
class EdadCard extends StatefulWidget {
  const EdadCard({super.key});
  @override
  State<EdadCard> createState() => _EdadCardState();
}

class _EdadCardState extends State<EdadCard> {
  final _ctrlDia = TextEditingController();
  final _ctrlMes = TextEditingController();
  final _ctrlAnio = TextEditingController();
  final _controller = EdadController();
  String _resultado = '';

  void _calcular() {
    setState(() {
      _resultado = _controller.procesar(
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
            const LabelText('Ingrese su fecha de nacimiento'),
            const SizedBox(height: 8),
            FechaInput(dia: _ctrlDia, mes: _ctrlMes, anio: _ctrlAnio),
            const SizedBox(height: 12),
            PrimaryButton(text: 'Calcular edad', onPressed: _calcular),
            const SizedBox(height: 12),
            ResultText(_resultado),
          ],
        ),
      ),
    );
  }
}

/// 🔹 Página
class EdadPage extends StatelessWidget {
  const EdadPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Calcular Edad (MVC + Atomic)')),
      body: const Padding(
        padding: EdgeInsets.all(16),
        child: EdadCard(),
      ),
    );
  }
}
