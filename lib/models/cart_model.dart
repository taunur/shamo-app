import 'package:shamo_app/models/product_model.dart';

class CartModel {
  int? id;
  ProductModel? productModel;
  int? quantity;

  CartModel({
    this.id,
    this.productModel,
    this.quantity,
  });

  CartModel.formJson(Map<String, dynamic> json) {
    id = json['id'];
    productModel = ProductModel.fromJson(json['product']);
    quantity = json['quantity'];
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'product': productModel!.toJson(),
      'quantity': quantity,
    };
  }

  double getTotalPrice() {
    return productModel!.price! * quantity!;
  }
}
