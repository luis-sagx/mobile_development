import '../../domain/entities/product_entity.dart';
import '../datasource/base_datasource.dart';
import 'base_repository.dart';

class ProductRepositoryImpl implements BaseRepository {
  final BaseDataSource datasource;

  ProductRepositoryImpl(this.datasource);

  @override
  Future<List<ProductEntity>> getProducts() {
    return datasource.fetchProduct();
  }

  @override
  Future<ProductEntity> createProducts(ProductEntity p) {
    return datasource.createProduct({
      "nombre": p.name,
      "precio": p.price,
      "stock": p.stock,
      "categoria": p.category,
    });
  }

  @override
  Future<bool> deleteProducts(String id) {
    return datasource.deleteProduct(id);
  }

  @override
  Future<ProductEntity> updateProducts(String id, ProductEntity p) {
    return datasource.updateProduct(id, {
      "nombre": p.name,
      "precio": p.price,
      "stock": p.stock,
      "categoria": p.category,
    });
  }
}
