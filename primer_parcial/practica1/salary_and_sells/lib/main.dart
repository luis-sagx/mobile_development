import 'package:flutter/material.dart';
import 'package:salary_and_sells/views/salary_view.dart';
import 'package:salary_and_sells/views/sells_view.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Salary Calculator',
      debugShowCheckedModeBanner: false,

      //rutas
      initialRoute: '/',
      routes: {
        '/': (context) => const SellsView(),
        '/result': (context) => const SalaryView(),
      },
    );
  }
}
