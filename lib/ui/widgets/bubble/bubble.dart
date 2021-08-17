import 'package:flutter/material.dart';
import 'bubble_border.dart';

class Bubble extends StatelessWidget {
  final String text;
  final String time;

  Bubble(this.text, this.time);

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 100,
      // padding: EdgeInsets.all(16),
      decoration: ShapeDecoration(
        color: Colors.white,
        shadows: [
          const BoxShadow(
            color: Colors.grey,
            offset: Offset(-1, 3),
            blurRadius: 2,
          )
        ],
        shape: BubbleBorder(),
      ),
      child: Container(
        width: 250,
        margin: EdgeInsets.fromLTRB(15, 10, 15, 10),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(text, overflow: TextOverflow.clip),
            iconTime(),
          ],
        ),
      ),
    );
  }

  // 時間表示部分
  Widget iconTime() {
    return Container(
      margin: EdgeInsets.only(top: 3),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Icon(Icons.access_time, color: Colors.grey, size: 16),
          Text(time, style: TextStyle(color: Colors.grey)),
        ],
      ),
    );
  }
}
