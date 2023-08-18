import 'dart:convert';
import 'package:shamo_app/constant.dart';
import 'package:shamo_app/models/cart_model.dart';
import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';

class TransactionService {
  final Logger logger = Logger();
  String baseUrl = '$baseConstantURL/api';

  Future<bool> checkout(
      String token, List<CartModel> carts, double totalPrice) async {
    var url = '$baseUrl/checkout';
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': token,
    };
    var body = jsonEncode({
      'address': 'Marsemoon',
      'items': carts
          .map(
            (cart) => {
              'id': cart.productModel!.id,
              'quantity': cart.quantity,
            },
          )
          .toList(),
      'status': "PENDING",
      'total_price': totalPrice,
      'shipping_price': 0,
    });

    var response = await http.post(
      Uri.parse(url),
      headers: headers,
      body: body,
    );

    logger.e(response.body);

    if (response.statusCode == 200) {
      return true;
    } else {
      throw Exception('Gagal Melakukan Checkout!');
    }
  }
}
