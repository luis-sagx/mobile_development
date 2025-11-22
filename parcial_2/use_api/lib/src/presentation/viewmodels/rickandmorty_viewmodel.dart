import 'package:flutter/material.dart';
import '../../domain/entities/rickandmorty.dart';
import '../../domain/usescases/get_rickandmorty_usescases.dart';

class RickandmortyViewmodel extends ChangeNotifier {
  final GetRickandmortyUsecase usecase;

  List<RickAndMorty> _characters = [];
  bool _isLoading = false;
  String? _error;

  List<RickAndMorty> get characters => _characters;
  bool get isLoading => _isLoading;
  String? get error => _error;

  RickandmortyViewmodel(this.usecase);

  Future<void> loadCharacters() async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      _characters = await usecase.call();
    } catch (e) {
      _error = e.toString();
    }

    _isLoading = false;
    notifyListeners();
  }
}
