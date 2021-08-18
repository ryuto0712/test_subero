import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:subero_mobile/routes/app_routes.dart';

import 'package:subero_mobile/ui/widgets/index.dart';

class OnGoingLesson extends StatelessWidget {
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
      onTap: () => Get.toNamed(Routes.INDIVIDUAL_MESSAGE, parameters: {'messagesId': 'sample_message'}),
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
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text('○○○○のレッスン', style: TextStyle(fontSize: 18)),
                    Row(
                      children: <Widget>[
                        Container(
                          child: CircleImage('images/app_icon2.png', 20),
                          margin: EdgeInsets.only(right: 10),
                        ),
                        Text('toichi shogo', style: TextStyle(fontSize: 14)),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Container(
              child: Icon(Icons.arrow_forward_ios, color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}
