import '../entities/product_entity.dart';
import '../../data/repositories/base_repository.dart';

class CreateProductUsecase {
  final BaseRepository repository;

  CreateProductUsecase(this.repository);

  Future<ProductEntity> call(ProductEntity p) {
    return repository.createProducts(p);
  }
}
