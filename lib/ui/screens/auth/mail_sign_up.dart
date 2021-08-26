import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:subero_mobile/controller/auth/auth_controller.dart';

class MailSignUp extends StatelessWidget {
  final AuthController c = Get.find<AuthController>();
  MailSignUp();

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
            child: Column(children: [
              Padding(padding: EdgeInsets.only(top: 10)),
              Text("名前"),
              TextField(onChanged: (value) => c.nameChanged(value)),
              Text("メール"),
              TextField(onChanged: (value) => c.emailChanged(value)),
              Text("パスワード"),
              TextField(onChanged: (value) => c.passwordChanged(value)),
              Padding(padding: EdgeInsets.only(top: 10)),
              ElevatedButton(
                onPressed: () => {c.registerUser()},
                child: Text("ユーザ登録",
                    style: TextStyle(color: Colors.black45, fontSize: 20)),
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.white),
                ),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
