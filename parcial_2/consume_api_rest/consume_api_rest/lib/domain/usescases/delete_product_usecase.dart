import '../../data/repositories/base_repository.dart';

class DeleteProductUsecase {
  final BaseRepository repository;

  DeleteProductUsecase(this.repository);
  Future<bool> call(String id) {
    return repository.deleteProducts(id);
  }
}
