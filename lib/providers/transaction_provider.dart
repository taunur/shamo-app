import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:shamo_app/models/cart_model.dart';
import 'package:shamo_app/services/transaction_service.dart';

class TransactionProvider with ChangeNotifier {
  final Logger logger = Logger();

  Future<bool> checkout(
      String token, List<CartModel> carts, double totalPrice) async {
    try {
      if (await TransactionService().checkout(token, carts, totalPrice)) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      logger.e('Error transcation: $e');
      return false;
    }
  }
}
