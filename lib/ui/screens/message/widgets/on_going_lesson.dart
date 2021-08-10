import 'package:flutter/material.dart';
import 'package:subero_mobile/ui/widgets/index.dart';

class OnGoingLesson extends StatelessWidget {
  OnGoingLesson();
  List products = ['aa', 'bb', 'cc', 'dd'];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 30,
          decoration: BoxDecoration(border: Border(bottom: BorderSide(color: Colors.grey.shade300, width: 1))),
        ),
        Row(
          // なぜかこれをなくすとエラーになる
          children: <Widget>[
            Expanded(
              child: SizedBox(
                height: 400.0,
                child: new ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: products.length,
                  itemBuilder: (BuildContext context, int index) {
                    return lessonList(context);
                  },
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget lessonList(BuildContext context) {
    return GestureDetector(
      // onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => LessonDetailsPage())),
      child: Container(
        height: 80,
        decoration: BoxDecoration(
          border: Border(bottom: BorderSide(color: Colors.grey.shade300, width: 1)),
        ),
        child: Row(
          children: <Widget>[
            Container(
              width: 100,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.fitWidth,
                  image: AssetImage('images/app_icon.png'),
                ),
              ),
            ),
            Container(
              child: Column(
                children: <Widget>[
                  Text('○○○○のレッスン'),
                  Row(
                    children: <Widget>[
                      CircleImage('images/app_icon2.png', 10),
                      Text('toichi shogo'),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              child: Icon(Icons.arrow_forward_sharp),
            ),
          ],
        ),
      ),
    );
  }
}
