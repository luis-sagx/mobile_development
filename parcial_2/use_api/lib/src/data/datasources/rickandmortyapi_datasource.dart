//Consume la api, hace las peticiones HTTP, convierte JSON a model

import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/rickandmorty_model.dart';

class RickandmortyapiDataSource {
  final String baseUrl = 'https://rickandmortyapi.com/api';

  Future<List<RickandmortyModel>> fetchRickAndMorty(int limit, int offset) async {
    final url = Uri.parse("$baseUrl?limit=$limit & offset=$offset");
    final resp = await http.get(url);
    if(resp.statusCode != 200){
      throw Exception('Failed to load data');
    }else{
      final data = jsonDecode(resp.body);
      final List results = data["results"];
      return results.map((e) => RickandmortyModel.fromJson(e)).toList();

    }
  }
}