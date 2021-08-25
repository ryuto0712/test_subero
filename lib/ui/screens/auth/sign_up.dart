import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:subero_mobile/controller/edit_profile/edit_profile_controller.dart';
import 'package:subero_mobile/data/provider/providers.dart';
import 'package:subero_mobile/data/provider/auth_provider.dart';
import 'package:subero_mobile/data/repository/repositorys.dart';
import 'package:subero_mobile/data/repository/auth_repository.dart';
import 'package:subero_mobile/controller/auth/auth_controller.dart';
import 'package:subero_mobile/ui/widgets/index.dart';

class SignUp extends StatelessWidget {
  final AuthController c = Get.put(AuthController(
      authRepository: AuthRepository(authProvider: AuthProvider()),
      userRepository: UserRepository(userProvider: UserProvider())));
  SignUp();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('ユーザ登録')),
      body: SingleChildScrollView(
        child: Container(
          alignment: Alignment.center,
          padding: EdgeInsets.only(top: 20),
          child: Container(
            width: 300,
            child: Column(
              children: [
                Text("名前"),
                TextField(onChanged: (value) => c.nameChanged(value)),
                Text("メール"),
                TextField(onChanged: (value) => c.emailChanged(value)),
                Text("パスワード"),
                TextField(onChanged: (value) => c.passwordChanged(value)),
                Padding(padding: EdgeInsets.only(top: 10)),
                ElevatedButton(
                  onPressed: () => {c.registerUser()},
                  child: Text("登録",
                      style: TextStyle(color: Colors.black45, fontSize: 20)),
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
