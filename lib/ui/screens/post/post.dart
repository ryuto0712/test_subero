import 'package:flutter/material.dart';
import 'widgets/index.dart';

class Post extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('投稿'),
        centerTitle: true,
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              NewPost(),
              PublishedPost(),
              Image.asset('images/post.png'),
            ],
          ),
        ),
      ),
    );
  }
}
