import '../../domain/entities/rickandmorty.dart';
import '../datasources/rickandmortyapi_datasource.dart';

class RickandmortyRepositoryImpl {
  final RickandmortyapiDataSource dataSource;

  RickandmortyRepositoryImpl(this.dataSource);

  Future<List<RickAndMorty>> getRickAndMortyCharacters() async {
    return await dataSource.fetchRickAndMorty();
  }
}
