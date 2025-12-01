import 'package:flutter/material.dart';
import 'package:login/utils/themes/general_theme.dart';
import 'package:login/view/prueba.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'App',
      theme: GeneralTheme.lightTheme,
      home: const Prueba(),
      debugShowCheckedModeBanner: false,
    );
  }
}
