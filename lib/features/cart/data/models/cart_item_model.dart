import 'package:ecommerce_crafty_bay/features/products/data/models/product_model.dart';

class CartItemModel {
  final String id;
  final ProductModel productModel;
  int quantity;
  final String? color;
  final String? size;

  CartItemModel({
    required this.id,
    required this.productModel,
    required this.color,
    required this.size,
    required this.quantity,
  });

  factory CartItemModel.fromJson(Map<String, dynamic> jsonData) {
    return CartItemModel(
      id: jsonData['_id'],
      productModel: ProductModel.fromJson(jsonData['product']),
      quantity: jsonData['quantity'],
      color: jsonData['color'],
      size: jsonData['size'],
    );
  }
}
