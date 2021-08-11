import 'package:flutter/material.dart';

class UserPage extends StatelessWidget {
  UserPage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('ユーザー')),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset('images/user_page.png'),
          ],
        ),
      ),
    );
  }
}
