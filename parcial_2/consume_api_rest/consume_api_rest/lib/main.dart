import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:consume_api_rest/data/datasource/product_api_datasource.dart';
import 'package:consume_api_rest/data/repositories/product_repository_impi.dart';
import 'package:consume_api_rest/domain/usescases/create_product_usecase.dart';
import 'package:consume_api_rest/domain/usescases/delete_product_usecase.dart';
import 'package:consume_api_rest/domain/usescases/get_product_usecase.dart';
import 'package:consume_api_rest/domain/usescases/update_product_usecase.dart';
import 'package:consume_api_rest/presentation/routes/app_routes.dart';
import 'package:consume_api_rest/presentation/viewmodel/product_view_model.dart';

void main() {
  // Inyección de dependencias
  final dataSource = ProductApiDataSource();
  final repo = ProductRepositoryImpl(dataSource);
  final useCase = GetProductsUseCase(repo);
  final createProductUsecase = CreateProductUsecase(repo);
  final updateProductUsecase = UpdateProductUsecase(repo);
  final deleteProductUsecase = DeleteProductUsecase(repo);

  runApp(
    MyApp(
      useCase: useCase,
      createProductUsecase: createProductUsecase,
      updateProductUsecase: updateProductUsecase,
      deleteProductUsecase: deleteProductUsecase,
    ),
  );
}

class MyApp extends StatelessWidget {
  final GetProductsUseCase useCase;
  final CreateProductUsecase createProductUsecase;
  final UpdateProductUsecase updateProductUsecase;
  final DeleteProductUsecase deleteProductUsecase;

  const MyApp({
    super.key,
    required this.useCase,
    required this.createProductUsecase,
    required this.updateProductUsecase,
    required this.deleteProductUsecase,
  });

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => ProductViewModel(
            useCase,
            createProductUsecase,
            updateProductUsecase,
            deleteProductUsecase,
          )..loadProducts(),
        ),
      ],
      child: MaterialApp(
        title: "Consumo API Flutter",
        routes: AppRoutes.routes,
      ),
    );
  }
}
