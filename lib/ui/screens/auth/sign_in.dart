import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:subero_mobile/data/provider/providers.dart';
import 'package:subero_mobile/data/provider/auth_provider.dart';
import 'package:subero_mobile/data/repository/repositorys.dart';
import 'package:subero_mobile/data/repository/auth_repository.dart';
import 'package:subero_mobile/controller/auth/auth_controller.dart';
import 'package:subero_mobile/ui/screens/auth/mail_sign_up.dart';

class SignIn extends StatelessWidget {
  final AuthController c = Get.put(AuthController(
      authRepository: AuthRepository(authProvider: AuthProvider()),
      userRepository: UserRepository(userProvider: UserProvider())));
  SignIn();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('サインイン')),
      body: SingleChildScrollView(
        child: Container(
          alignment: Alignment.center,
          padding: EdgeInsets.only(top: 20),
          child: Container(
            width: 300,
            child: Column(
              children: [
                Text("メールアドレス"),
                TextField(onChanged: (value) => c.emailChanged(value)),
                Text("パスワード"),
                TextField(onChanged: (value) => c.passwordChanged(value)),
                Padding(padding: EdgeInsets.only(top: 10)),
                ElevatedButton(
                  onPressed: () => {c.signInWithEmail()},
                  child: Text("ログイン",
                      style: TextStyle(color: Colors.black45, fontSize: 20)),
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.white),
                  ),
                ),
                GestureDetector(
                  onTap: () => Get.to(MailSignUp()),
                  child: Image.asset("images/mail_sign_up_button.png"),
                ),
                GestureDetector(
                  onTap: () => c.signInWithGoogle(),
                  child: Image.asset("images/google_sign_in_button.png"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
