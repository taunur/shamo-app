import 'dart:convert';
import 'package:shamo_app/constant.dart';
import 'package:shamo_app/models/users_model.dart';
import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';

class AuthService {
  final Logger logger = Logger();
  String baseUrl = '$baseConstantURL/api';

  // Register
  Future<UserModel> register({
    required String name,
    required String username,
    required String email,
    required String password,
  }) async {
    var url = '$baseUrl/register';
    var headers = {
      'Content-Type': 'application/json',
      'Connection': 'keep-alive',
    };
    var body = jsonEncode({
      'name': name,
      'username': username,
      'email': email,
      'password': password,
    });

    var response = await http.post(
      Uri.parse(url),
      headers: headers,
      body: body,
    );

    logger.d(response.body);

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body)['data'];
      UserModel user = UserModel.fromJson(data['user']);
      user.token = "Bearer ${data['access_token']}";
      return user;
    } else {
      throw Exception('Gagal Register');
    }
  }

  // Login
  Future<UserModel> login({
    required String email,
    required String password,
  }) async {
    var url = '$baseUrl/login';
    var headers = {
      'Content-Type': 'application/json',
      'Connection': 'keep-alive',
    };
    var body = jsonEncode({
      'email': email,
      'password': password,
    });

    var response = await http.post(
      Uri.parse(url),
      headers: headers,
      body: body,
    );

    // logger.d(response.body);

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body)['data'];
      UserModel user = UserModel.fromJson(data['user']);
      user.token = "Bearer ${data['access_token']}";
      return user;
    } else {
      throw Exception('Gagal Login');
    }
  }
}
