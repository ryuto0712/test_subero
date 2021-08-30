import 'package:flutter/material.dart';
import 'package:subero_mobile/data/model/lesson_model.dart';
import 'package:subero_mobile/ui/widgets/index.dart';

class Guide extends StatelessWidget {
  Guide();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ガイド'),
      ),
      body: guideTest(),
    );
  }

  Widget guideTest() {
    List colors = [Colors.red, Colors.green, Colors.blue, Colors.black, Colors.yellow];
    return GridView.count(
      crossAxisCount: 2,
      children: [
        for (int i = 0; i < 4; i++) LessonCardSmall(LessonModel(hostName: 'izuru', lessonName: 'sampleLesson')),
      ],
    );
  }
}
