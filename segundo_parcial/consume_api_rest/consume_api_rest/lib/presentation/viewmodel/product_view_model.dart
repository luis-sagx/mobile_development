import 'package:consume_api_rest/domain/usescases/create_product_usecase.dart';
import 'package:consume_api_rest/domain/usescases/delete_product_usecase.dart';
import 'package:consume_api_rest/domain/usescases/update_product_usecase.dart';

import '../../domain/entities/product_entity.dart';
import '../../domain/usescases/get_product_usecase.dart';
import 'base_viewmodel.dart';

class ProductViewModel extends BaseViewModel {
  final GetProductsUseCase useCase;
  final CreateProductUsecase createProductUsecase;
  final UpdateProductUsecase updateProductUsecase;
  final DeleteProductUsecase deleteProductUsecase;

  List<ProductEntity> products = [];

  ProductViewModel(
    this.useCase,
    this.createProductUsecase,
    this.updateProductUsecase,
    this.deleteProductUsecase,
  );

  Future<void> loadProducts() async {
    setLoading(true);
    try {
      products = await useCase();
      setLoading(false);
    } catch (e) {
      setLoading(false);
      print("Error al cargar productos: $e");
    }
  }

  Future<void> createProduct(ProductEntity product) async {
    try {
      await createProductUsecase(product);
      await loadProducts();
    } catch (e) {
      print("Error al crear producto: $e");
    }
  }

  Future<void> updateProduct(String id, ProductEntity product) async {
    try {
      await updateProductUsecase(id, product);
      await loadProducts();
    } catch (e) {
      print("Error al actualizar producto: $e");
    }
  }

  Future<void> deleteProduct(String id) async {
    try {
      await deleteProductUsecase(id);
      await loadProducts();
    } catch (e) {
      print("Error al eliminar producto: $e");
    }
  }
}
