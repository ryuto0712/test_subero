import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:subero_mobile/controller/lesson_post/lesson_post_controller.dart';
import 'package:subero_mobile/data/provider/lesson_provider.dart';
import 'package:subero_mobile/data/provider/providers.dart';
import 'package:subero_mobile/data/repository/lesson_repository.dart';
import 'package:subero_mobile/data/repository/repositorys.dart';
import 'package:subero_mobile/ui/screens/post_event/widgets/post_infomation_list.dart';
import 'widgets/index.dart';

// TODO: 写真選択の実装
// TODO: ファイルの分割
// TODO: GetStateでの画面更新ができていない？
// TODO: 画面を移動した際にStateが破棄されない

class PostEvent extends StatelessWidget {
  // LessonPostController c = Get.find();
  // bindingできてなさそうだったのでベタ書き
  final LessonPostController c = Get.put(
    LessonPostController(
      lessonRepository: LessonRepository(lessonProvider: LessonProvider()),
      userRepository: UserRepository(userProvider: UserProvider()),
    ),
  );

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
            SizedBox(height: 30),
            TextField(
              onChanged: (text) => c.lesson.lessonName = text,
              maxLines: null, // 折り返しの設定
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: BorderSide(color: Colors.grey)),
                focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: BorderSide(color: Colors.grey)),
                labelText: '新規レッスン名',
              ),
            ),
            SelectImages(),
            PostInfomationList(),
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
              onChanged: (text) => c.lesson.lessonDescription = text,
              maxLines: null, // 折り返しの設定
              minLines: 5,
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: BorderSide(color: Colors.grey)),
                focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: BorderSide(color: Colors.grey)),
              ),
            ),
            LessonPriceAndTime(),
            ElevatedButton(
              onPressed: () => {c.postLesson(), Get.back()},
              child: Text('投稿'),
            ),
            Image.asset('images/event_post.png'),
          ],
        ),
      ),
    );
  }
}
