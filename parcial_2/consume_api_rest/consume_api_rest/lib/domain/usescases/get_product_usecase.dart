import '../entities/product_entity.dart';
import '../../data/repositories/base_repository.dart';

class GetProductsUseCase{
  final BaseRepository repository;

  GetProductsUseCase(this.repository);

  Future<List<ProductEntity>> call(){
    return repository.getProducts();
  }
}
