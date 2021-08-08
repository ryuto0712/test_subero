import 'package:flutter/material.dart';
import 'package:subero_mobile/widgets/index.dart';
// improt '../../models/lesson_data.dart';

class LessonCardWide extends StatelessWidget {
  // LessonData lessonData; // レッスンデータ
  double width; // カードの幅
  String lessonIcon = 'images/icon_sample.png';
  String lessonName = 'sample lesson name';
  String comment = 'sample comment';
  String hostIcon = 'images/icon_sample.png';
  String hostName = 'Toichi Shogo';
  int price = 10000;

  LessonCardWide({this.width: 400}); // 幅の初期設定は適当

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => LessonDetails())),
      child: Container(
        width: width,
        height: 100,
        child: Card(
          margin: const EdgeInsets.all(5),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
          clipBehavior: Clip.antiAliasWithSaveLayer, // カードの角丸
          child: Container(
            width: 120,
            height: 140,
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
                Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(bottom: 5),
                      child: Text(lessonName, style: TextStyle(fontSize: 11)),
                    ),
                    Container(
                      margin: EdgeInsets.only(bottom: 5),
                      child: Text(comment, style: TextStyle(fontSize: 11)),
                    ),
                    Container(
                      child: Row(
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.only(left: 5),
                            child: GestureDetector(
                              // onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => UserPagePage())),
                              child: Row(
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(right: 5),
                                    child: CircleImage(hostIcon, 15, width: 1, color: Colors.grey.shade500),
                                    width: 15,
                                    height: 15,
                                  ),
                                  Text(hostName, style: TextStyle(fontSize: 9)),
                                ],
                              ),
                            ),
                          ),
                          Container(child: Text(price.toString() + '円')),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
