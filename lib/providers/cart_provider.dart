import 'package:flutter/material.dart';
import 'package:shamo_app/models/cart_model.dart';
import 'package:shamo_app/models/product_model.dart';

class CartProvider with ChangeNotifier {
  List<CartModel> _carts = [];

  List<CartModel> get carts => _carts;

  set carts(List<CartModel> carts) {
    _carts = carts;
    notifyListeners();
  }

  // menambah cart
  addCart(ProductModel product) {
    if (productExsist(product)) {
      int index = _carts
          .indexWhere((element) => element.productModel!.id == product.id);
      _carts[index].quantity = (_carts[index].quantity ?? 0) + 1;
    } else {
      _carts.add(
        CartModel(
          id: _carts.length,
          productModel: product,
          quantity: 1,
        ),
      );
    }

    notifyListeners();
  }

  // menghapus cart
  removeCart(int id) {
    _carts.removeAt(id);
    notifyListeners();
  }

  // menambah quantity
  addQuantity(int id) {
    _carts[id].quantity = (_carts[id].quantity ?? 0) + 1;
    notifyListeners();
  }

  // mengurangi quantity
  reduceQuantity(int id) {
    _carts[id].quantity = (_carts[id].quantity ?? 0) - 1;
    // handle jika 0 / -1
    if (_carts[id].quantity == 0) {
      _carts.removeAt(id);
    }
    notifyListeners();
  }

  totalItems() {
    int total = 0;
    for (var item in _carts) {
      total += item.quantity ?? 0; // Add 0 if quantity is null
    }
    return total;
  }

  // menghitung total harga
  totalPrice() {
    double total = 0;
    for (var item in _carts) {
      total += (item.quantity ?? 0) * (item.productModel?.price ?? 0);
    }
    return total;
  }

  productExsist(ProductModel product) {
    if (_carts
            .indexWhere((element) => element.productModel!.id == product.id) ==
        -1) {
      return false;
    } else {
      return true;
    }
  }
}
