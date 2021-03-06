import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:subero_mobile/ui/screens/index.dart';

class DateSearch extends StatelessWidget {
  DateSearch();
  List<String> caption = ['◎月◎日', '△月△日', '□月□日', '☆月☆日'];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      // child: Text('test'),
      child: ListView(
        children: [
          for (int i = 0; i < caption.length; i++) tile(context, i),
        ],
      ),
    );
  }

  Widget tile(BuildContext context, int i) {
    double height = 35;
    if (i == 0) {
      return GestureDetector(
        onTap: () => Get.to(Searched(), id: 1),
        child: Container(
          height: height,
          decoration: BoxDecoration(
              border: Border.symmetric(
                  horizontal:
                      BorderSide(color: Colors.grey.shade300, width: 1))),
          child: Container(
              margin: EdgeInsets.fromLTRB(height / 2, height / 5, 0, 0),
              child: Text(caption[i] + 'からさがす')),
        ),
      );
    } else {
      return GestureDetector(
        onTap: () => Get.to(Searched(), id: 1),
        child: Container(
          height: height,
          decoration: BoxDecoration(
              border: Border(
                  bottom: BorderSide(color: Colors.grey.shade300, width: 1))),
          child: Container(
              margin: EdgeInsets.fromLTRB(height / 2, height / 5, 0, 0),
              child: Text(caption[i] + 'からさがす')),
        ),
      );
    }
  }
}
