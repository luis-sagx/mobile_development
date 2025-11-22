import 'package:flutter/material.dart';
import 'package:salary_clean_architecture/domain/entities/operator.dart';
import 'package:salary_clean_architecture/domain/entities/result_operator.dart';
import 'package:salary_clean_architecture/domain/usescases/calculate_increase_usecase.dart';

class OperatorViewmodel extends ChangeNotifier {
  final CalculateIncreaseUsecase _usecase;

  OperatorViewmodel(this._usecase);

  ResultOperator? _result;

  ResultOperator calcular(double salary, double antique) {
    final operator = Operator(salary: salary, antique: antique);
    _result = _usecase(operator);
    notifyListeners();
    return _result!;
  }
}
