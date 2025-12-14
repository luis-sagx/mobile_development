import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../models/satellite_model.dart';

class SatelliteController extends ChangeNotifier {
  SatelliteResponse? _satelliteResponse;
  bool _isLoading = false;
  String? _error;

  SatelliteResponse? get satelliteResponse => _satelliteResponse;
  bool get isLoading => _isLoading;
  String? get error => _error;

  Future<void> fetchSatellites() async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      final uri = Uri.parse('https://ssd-api.jpl.nasa.gov/sb_sat.api');

      debugPrint('Fetching satellites from: $uri');
      final response = await http.get(uri);
      debugPrint('Response status: ${response.statusCode}');

      if (response.statusCode == 200) {
        final jsonMap = json.decode(response.body);
        _satelliteResponse = SatelliteResponse.fromJson(jsonMap);
      } else {
        _error = 'Failed to load satellites: ${response.statusCode}';
        debugPrint('Error body: ${response.body}');
      }
    } catch (e) {
      _error = 'Error fetching data: $e';
      debugPrint('Exception: $e');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
