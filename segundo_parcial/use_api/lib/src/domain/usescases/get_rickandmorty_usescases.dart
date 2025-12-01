import '../entities/rickandmorty.dart';
import '../../data/repositories/rickandmorty_repository_impl.dart';

class GetRickandmortyUsecase {
  final RickandmortyRepositoryImpl repository;

  GetRickandmortyUsecase(this.repository);

  Future<List<RickAndMorty>> call() async {
    return await repository.getRickAndMortyCharacters();
  }
}
