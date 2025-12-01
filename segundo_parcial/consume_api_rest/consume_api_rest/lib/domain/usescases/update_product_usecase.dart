import '../entities/product_entity.dart';
import '../../data/repositories/base_repository.dart';

class UpdateProductUsecase {
  final BaseRepository repository;

  UpdateProductUsecase(this.repository);

  Future<ProductEntity> call(String id, ProductEntity p) {
    return repository.updateProducts(id, p);
  }
}
