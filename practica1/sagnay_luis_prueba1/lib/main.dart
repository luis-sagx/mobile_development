import 'package:flutter/material.dart';
import 'package:sagnay_luis_prueba1/views/number_view.dart';
import 'package:sagnay_luis_prueba1/views/result_view.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Número Abundante',
      debugShowCheckedModeBanner: false,
      //rutas
      initialRoute: '/',
      routes: {
        '/': (context) => const NumberView(),
        '/result': (context) => const ResultView(),
      },
    );
  }
}
