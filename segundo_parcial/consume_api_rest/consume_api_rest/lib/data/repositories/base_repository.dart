import '../../domain/entities/product_entity.dart';

abstract class BaseRepository {
  Future<List<ProductEntity>> getProducts();
  Future<ProductEntity> createProducts(ProductEntity p);
  Future<ProductEntity> updateProducts(String id, ProductEntity p);
  Future<bool> deleteProducts(String id);
}
