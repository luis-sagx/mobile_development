import 'package:flutter/material.dart';
import 'view/edad_page.dart';

void main() => runApp(const EdadApp());

class EdadApp extends StatelessWidget {
  const EdadApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Cálculo de Edad',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
        useMaterial3: true,
      ),
      home: const EdadPage(),
    );
  }
}
