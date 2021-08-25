import '../provider/auth_provider.dart';
import "../provider/providers.dart";
import "../model/user_model.dart";
import 'dart:io';

class AuthRepository {
  final AuthProvider authProvider;

  AuthRepository({required this.authProvider});

  registerUser(String email, String password) {
    return authProvider.registerUser(email, password);
  }

  loginUser(String email, String password) {
    return authProvider.loginUser(email, password);
  }

  resetPassword(String email) {
    return authProvider.resetPassword(email);
  }

  signOutUser() {
    return authProvider.signOutUser();
  }
}
