import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:subero_mobile/ui/screens/index.dart';

import 'package:subero_mobile/ui/widgets/index.dart';

class Categories extends StatelessWidget {
  final List<String> categoryNames = [
    '初心者向け',
    'カービング',
    'ジャンプ',
    'ジブ',
    'イベント',
  ];
  final List<String> icons = [
    'images/category.png',
    'images/category.png',
    'images/category.png',
    'images/category.png',
    'images/category.png',
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.fromLTRB(15, 0, 15, 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(bottom: 3),
              child: Text('おすすめのカテゴリー'),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[for (int i = 0; i < categoryNames.length; i++) category(context, icons[i], categoryNames[i])],
            )
          ],
        ));
  }

  Widget category(BuildContext context, String icon, String name) {
    return GestureDetector(
      onTap: () => Get.to(Searched(), id: 0),
      child: Column(
        children: <Widget>[
          Container(
            child: CircleImage(icon, 50, width: 1, color: Colors.grey.shade400),
          ),
          Container(
            child: Text(name, style: TextStyle(fontSize: 9)),
          ),
        ],
      ),
    );
  }
}
