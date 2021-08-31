import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:subero_mobile/controller/lesson_post/lesson_post_controller.dart';

// TODO: 画像表示が更新されない

class SelectImages extends StatelessWidget {
  final LessonPostController c = Get.find();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          for (int i = 0; i < 1; i++)
            GestureDetector(
              onTap: () => {c.addLessonImage()},
              child: Container(
                height: 80,
                width: 80,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.shade400),
                  borderRadius: BorderRadius.circular(10),

                  // image: DecorationImage(
                  //   image: AssetImage(imageUrls[i] == '' ? 'images/app_icon.png' : imageUrls[i]),
                  // ),
                ),
                // child: (c.lesson.lessonImage == 'https://firebasestorage.googleapis.com/v0/b/subero-app.appspot.com/o/user_icon%2F308866.png?alt=media&token=dfc47611-1203-4953-be36-7c6bf9806cb3')
                //     ? Icon(Icons.add_a_photo)
                //     : Image.network(c.lesson.lessonImage),
                child: Obx(() => Image.network(c.lesson.lessonImage)),
              ),
            ),
          //   GestureDetector(
          //     onTap: () => {c.addLessonImage()},
          //     child: Icon(Icons.add),
          //   ),
        ],
      ),
    );
  }
}
