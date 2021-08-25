import 'package:subero_mobile/ui/screens/auth/login_check.dart';

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

  loginFromEmail(String email, String password) {
    return authProvider.loginFromEmail(email, password);
  }

  loginCheck(){
    return authProvider.loginCheck();
  }
}
  // resetPassword(String email) {
  //   return authProvider.resetPassword(email);
  // }

  // signOutUser() {
  //   return authProvider.signOutUser();
  // }

