import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'widgets/index.dart';

class PostEvent extends StatelessWidget {
  PostEvent();
  var lessonDescription;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(title: Text('イベントの投稿')),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(icon: Icon(Icons.arrow_back_ios), onPressed: () => Get.back()),
        elevation: 0.0,
      ),
      // extendBodyBehindAppBar: true,
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Text('詳しい集合場所'),
            TextField(
              onChanged: (text) => {},
              maxLines: null, // 折り返しの設定
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: BorderSide(color: Colors.grey)),
                focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: BorderSide(color: Colors.grey)),
              ),
            ),
            Text('レッスン説明'),
            TextField(
              onChanged: (text) => lessonDescription = text,
              maxLines: null, // 折り返しの設定
              minLines: 5,
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: BorderSide(color: Colors.grey)),
                focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: BorderSide(color: Colors.grey)),
              ),
            ),
            ElevatedButton(onPressed: () => {}, child: Text('投稿')),
            Image.asset('images/event_post.png'),
          ],
        ),
      ),
    );
  }
}
