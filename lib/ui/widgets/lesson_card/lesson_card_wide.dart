import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:subero_mobile/routes/routes.dart';
import 'package:subero_mobile/ui/screens/index.dart';
import 'package:subero_mobile/ui/widgets/index.dart';

class LessonCardWide extends StatelessWidget {
  // LessonData lessonData; // レッスンデータ
  final double width; // カードの幅
  final String lessonId; //
  String lessonIcon = 'images/icon_sample.png';
  String lessonName = 'sample lesson name';
  String comment = 'sample comment';
  String hostIcon = 'images/icon_sample.png';
  String hostName = 'Toichi Shogo';
  int price = 10000;

  LessonCardWide({required this.lessonId, this.width: 400}); // 幅の初期設定は適当

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.toNamed(Routes.LESSON_DETAILS, id: null),
      child: Container(
        width: width,
        height: 120,
        child: Card(
          margin: const EdgeInsets.fromLTRB(15, 0, 15, 10),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          clipBehavior: Clip.antiAliasWithSaveLayer, // カードの角丸
          child: Container(
            child: Row(
              children: [
                Container(
                  width: 100,
                  margin: EdgeInsets.only(bottom: 3),
                  decoration: BoxDecoration(
                    border: Border(
                      right: BorderSide(width: 1, color: Colors.grey.shade300),
                    ),
                    image: DecorationImage(
                      fit: BoxFit.fitWidth,
                      image: AssetImage(lessonIcon),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(12, 4, 8, 4),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(lessonName, style: TextStyle(fontSize: 18)),
                        Text(comment, style: TextStyle(fontSize: 14)),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: <Widget>[
                            _hostName(),
                            Container(
                              child: Text(
                                price.toString() + '円',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _hostName() {
    return GestureDetector(
      onTap: () => Get.to(UserPage(), id: null),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.only(right: 5),
            child: CircleImage(hostIcon, 15, width: 1, color: Colors.grey.shade500),
            width: 15,
            height: 15,
          ),
          Text(hostName, style: TextStyle(fontSize: 12)),
        ],
      ),
    );
  }
}
