import 'package:flutter/material.dart';
import 'src/data/datasources/rickandmortyapi_datasource.dart';
import 'src/data/repositories/rickandmorty_repository_impl.dart';
import 'src/domain/usescases/get_rickandmorty_usescases.dart';
import 'src/presentation/viewmodels/rickandmorty_viewmodel.dart';
import 'src/presentation/views/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Configuración de dependencias
    final dataSource = RickandmortyapiDataSource();
    final repository = RickandmortyRepositoryImpl(dataSource);
    final usecase = GetRickandmortyUsecase(repository);
    final viewModel = RickandmortyViewmodel(usecase);

    return MaterialApp(
      title: 'Rick and Morty API',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        useMaterial3: true,
      ),
      home: HomePage(viewModel: viewModel),
    );
  }
}
