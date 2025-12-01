import 'dart:convert';
import 'package:http/http.dart' as http;
import 'base_datasource.dart';
import '../models/product_model.dart';

class ProductApiDataSource implements BaseDataSource {
  //url
  final String baseUrl = "http://10.40.31.144:3000/api/productos";

  @override
  Future<List<ProducModel>> fetchProduct() async {
    final url = Uri.parse(baseUrl);
    final response = await http.get(url);

    if (response.statusCode != 200) {
      throw Exception("Error al cargar los productos");
    }

    final List data = json.decode(response.body);
    return data.map((item) => ProducModel.fromJson(item)).toList();
  }

  @override
  Future<ProducModel> createProduct(Map<String, dynamic> data) async {
    final response = await http.post(
      Uri.parse(baseUrl),
      headers: {"Content-Type": "application/json"},
      body: json.encode(data),
    );

    if (response.statusCode != 201) {
      throw Exception("Error al crear el producto");
    }

    return ProducModel.fromJson(json.decode(response.body));
  }

  @override
  Future<bool> deleteProduct(String id) async {
    final response = await http.delete(Uri.parse("$baseUrl/$id"));

    return response.statusCode == 200;
  }

  @override
  Future<ProducModel> updateProduct(
    String id,
    Map<String, dynamic> data,
  ) async {
    final response = await http.put(
      Uri.parse("$baseUrl/$id"),
      headers: {"Content-Type": "application/json"},
      body: json.encode(data),
    );

    if (response.statusCode != 200 && response.statusCode != 201) {
      throw Exception("Error al actualizar el producto");
    }

    return ProducModel.fromJson(json.decode(response.body));
  }
}
