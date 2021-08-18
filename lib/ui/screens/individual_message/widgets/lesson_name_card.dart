import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:subero_mobile/ui/widgets/index.dart';

class LessonNameCard extends StatelessWidget {
  static const lessonName = '【初心者におすすめ】グラトリ入門3時間レッスン';
  static const hostName = 'Toichi Shogo';
  static const hostIcon = 'images/icon_sample.png';
  final GetStorage box = GetStorage();

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Padding(
        padding: EdgeInsets.all(15),
        child: Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(bottom: 10),
              child: Text(
                lessonName,
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
            ),
            Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: CircleImage(hostIcon, 40),
                ),
                Text(hostName, style: TextStyle(fontSize: 20, color: Colors.grey)),
              ],
            )
          ],
        ),
      ),
    );
  }
}
