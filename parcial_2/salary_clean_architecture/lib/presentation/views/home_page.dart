import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:salary_clean_architecture/presentation/routes/app_routes.dart';
import 'package:salary_clean_architecture/presentation/viewmodels/operator_viewmodel.dart';
import 'package:salary_clean_architecture/presentation/views/widget/calculate_button.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _formKey = GlobalKey<FormState>();
  final _salaryController = TextEditingController();
  double _selectedYears = 1.0;

  @override
  void dispose() {
    _salaryController.dispose();
    super.dispose();
  }

  void _calculateIncrease() {
    if (_formKey.currentState!.validate()) {
      final viewModel = context.read<OperatorViewmodel>();
      final salary = double.parse(_salaryController.text);
      final result = viewModel.calcular(salary, _selectedYears);

      Navigator.pushNamed(context, AppRoutes.resultado, arguments: result);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cálculo de Aumento Salarial'),
        centerTitle: true,
        elevation: 2,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: 20),
                Icon(
                  Icons.attach_money,
                  size: 80,
                  color: Theme.of(context).colorScheme.primary,
                ),
                const SizedBox(height: 30),
                Text(
                  'Ingrese la información del operario',
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 40),
                TextFormField(
                  controller: _salaryController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    labelText: 'Salario Actual',
                    border: OutlineInputBorder(),
                    hintText: 'Ingrese el salario',
                  ),
                ),
                const SizedBox(height: 40),
                Text(
                  'Anios de Antiguedad',
                  style: Theme.of(
                    context,
                  ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 20),
                Card(
                  elevation: 2,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        RadioListTile<double>(
                          title: const Text('Menos de 1 anio'),
                          value: 1.0,
                          groupValue: _selectedYears,
                          onChanged: (value) {
                            setState(() {
                              _selectedYears = value!;
                            });
                          },
                        ),
                        RadioListTile<double>(
                          title: const Text('De 1 a 9 anios'),
                          value: 1.0,
                          groupValue: _selectedYears,
                          onChanged: (value) {
                            setState(() {
                              _selectedYears = value!;
                            });
                          },
                        ),
                        RadioListTile<double>(
                          title: const Text('10 anios o mas'),
                          value: 10.0,
                          groupValue: _selectedYears,
                          onChanged: (value) {
                            setState(() {
                              _selectedYears = value!;
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 40),
                CalculateButton(
                  text: 'Calcular Aumento',
                  onPressed: _calculateIncrease,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
