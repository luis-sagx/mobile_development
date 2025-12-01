import '../../domain/entities/product_entity.dart';

class ProducModel extends ProductEntity {
  ProducModel({
    required super.id,
    required super.name,
    required super.price,
    required super.stock,
    required super.category,
  });

  factory ProducModel.fromJson(Map<String, dynamic> json) {
    return ProducModel(
      id: json['_id'],
      name: json['nombre'],
      price: (json['precio'] as num).toDouble(),
      stock: json['stock'],
      category: json['categoria'],
    );
  }
}
