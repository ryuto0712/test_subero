import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:subero_mobile/controller/auth/auth_controller.dart';
import 'package:subero_mobile/data/provider/auth_provider.dart';
import 'package:subero_mobile/data/provider/providers.dart';
import 'package:subero_mobile/main.dart';
import '../../../data/repository/user_repository.dart';
import '../../../data/provider/user_provider.dart';
import '../../../data/repository/auth_repository.dart';

class LoginCheck extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // ログイン状態に応じて、画面を切り替える
    final AuthController c = Get.put(AuthController(
        authRepository: AuthRepository(authProvider: AuthProvider()),
        userRepository: UserRepository(userProvider: UserProvider())));

    c.loginCheck();

    return Container(
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset("images/app_icon.png"),
        ],
      ),
    );
  }
}
