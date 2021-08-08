// import 'package:flutter/material.dart';
// import 'package:subero_mobile/widgets/index.dart';
// import 'package:subero_mobole/models/lesson_data.dart';

// class PublishedPost extends StatelessWidget {
//   PublishedPost();
//   List<LessonData> lessonDatas = [
//     LessonData(lessonName: 'lessonName', hostName: 'toichi shogo', lessonIcon: 'images/app_icon.png', hostIcon: 'images/app_icon2.png', price: 3000, comment: 'comment'),
//     LessonData(lessonName: 'lessonName', hostName: 'toichi shogo', lessonIcon: 'images/app_icon.png', hostIcon: 'images/app_icon2.png', price: 3000, comment: 'comment'),
//     LessonData(lessonName: 'lessonName', hostName: 'toichi shogo', lessonIcon: 'images/app_icon.png', hostIcon: 'images/app_icon2.png', price: 3000, comment: 'comment'),
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: Column(
//         children: <Widget>[
//           Text('掲載中の投稿'),
//           genWideLessonCards(lessonDatas),
//         ],
//       ),
//     );
//   }

//   Widget genWideLessonCards(List<LessonData> lessonDatas) {
//     return Column(
//       children: <Widget>[
//         for (int i = 0; i < lessonDatas.length; i++)
//           LessonCardWide(
//             lessonDatas[i],
//             width: 400,
//           ),
//       ],
//     );
//   }
// }
