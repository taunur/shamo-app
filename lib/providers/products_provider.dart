import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:shamo_app/models/product_model.dart';
import 'package:shamo_app/services/product_service.dart';

class ProductProvider with ChangeNotifier {
  final Logger logger = Logger();

  List<ProductModel> _product = [];

  List<ProductModel> get products => _product;

  set products(List<ProductModel> products) {
    _product = products;
    notifyListeners();
  }

  Future<void> getProducts() async {
    try {
      List<ProductModel> products = await ProductService().getProducts();
      _product = products;
    } catch (e) {
      logger.e('Error get products: $e');
    }
  }
}
