import '../models/product_model.dart';

abstract class BaseDataSource {
  Future<List<ProducModel>> fetchProduct();
  Future<ProducModel> createProduct(Map<String, dynamic> data);
  Future<ProducModel> updateProduct(String id, Map<String, dynamic> data);
  Future<bool> deleteProduct(String id);
}
