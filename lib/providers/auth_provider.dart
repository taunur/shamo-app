import 'package:flutter/material.dart';
import 'package:shamo_app/models/users_model.dart';
import 'package:shamo_app/services/auth_service.dart';
import 'package:logger/logger.dart';

class AuthProvider with ChangeNotifier {
  final Logger logger = Logger();
  late UserModel _user;

  UserModel get user => _user;

  set user(UserModel user) {
    _user = user;
    notifyListeners();
  }

  // register
  Future<bool> register({
    required String name,
    required String username,
    required String email,
    required String password,
  }) async {
    try {
      UserModel user = await AuthService().register(
        name: name,
        username: username,
        email: email,
        password: password,
      );

      _user = user;
      return true;
    } catch (e) {
      logger.e('Error registering user: $e');
      return false;
    }
  }

  // Login
  Future<bool> login({
    required String email,
    required String password,
  }) async {
    try {
      UserModel user = await AuthService().login(
        email: email,
        password: password,
      );

      _user = user;
      return true;
    } catch (e) {
      logger.e('Error login user: $e');
      return false;
    }
  }
}
