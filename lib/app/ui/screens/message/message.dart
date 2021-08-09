import 'package:flutter/material.dart';

import 'widgets/index.dart';

class Message extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Navigator(
      onGenerateRoute: (settings) {
        return MaterialPageRoute(
          settings: settings,
          builder: (context) {
            return _();
          },
        );
      },
    );
  }

  Widget _() {
    return Scaffold(
      appBar: AppBar(title: Text('メッセージ')),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            ElevatedButton(
              // onPressed: () => Navigator.of(context).push(
              //   MaterialPageRoute(
              //     builder: (context) => IndividualMessagePage(),
              //   ),
              // ),
              onPressed: () {},
              child: Text('個別メッセージ'),
            ),
            MessageContents(),
            Image.asset('images/message.png'),
          ],
        ),
      ),
    );
  }
}
