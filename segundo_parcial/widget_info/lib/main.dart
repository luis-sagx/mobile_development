import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'controller/satellite_controller.dart';
import 'views/wiget_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => SatelliteController())],
      child: MaterialApp(
        title: 'NASA Widget Info',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
          useMaterial3: true,
        ),
        home: const WidgetView(),
      ),
    );
  }
}
