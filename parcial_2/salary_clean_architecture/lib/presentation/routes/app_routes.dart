import 'package:flutter/material.dart';
import 'package:salary_clean_architecture/domain/entities/result_operator.dart';
import 'package:salary_clean_architecture/presentation/views/result_page.dart';
import '../views/home_page.dart';

class AppRoutes {
  static const home = '/';
  static const resultado = '/resultado';

  static Map<String, WidgetBuilder> routes = {
    home: (_) => HomePage(),
    resultado: (context) {
      final resultado =
          ModalRoute.of(context)!.settings.arguments as ResultOperator;
      return ResultPage(result: resultado);
    },
  };
}
