import 'package:flutter/rendering.dart';
import 'package:subero_mobile/common/tag/ClickableTagGenerator.dart';

import '../../importer.dart';
import 'index.dart';

class LessonContents extends StatelessWidget {
  const LessonContents(this.titleText, this.tagNames, this.description, this.comments, this.userNames, this.userIcons, {Key? key}) : super(key: key);

  final String titleText;
  final List<String> tagNames;
  final String description;
  final List<String> comments;
  final List<String> userNames;
  final List<String> userIcons;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(
        decoration: BoxDecoration(
            border: Border(
          top: BorderSide(color: Colors.grey, width: 1),
        )),
        child: Column(
          children: [
            SizedBox(
              height: 50,
            ),
            // Image.asset('images/lesson_detail_top.png'),
            LessonTitle(titleText),
            ClickableTagGenerator(tagNames),

            // Image.asset('images/lesson_detail_middle.png'),
            PlaceDatePrice('神立スキー場', '12/28 13:00~', 10000, 3),
            LessonDescription(description),
            Comments(comments, userNames, userIcons),
          ],
        ),
      ),
    );
  }
}
