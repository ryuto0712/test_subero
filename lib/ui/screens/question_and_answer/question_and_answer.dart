import 'package:flutter/material.dart';
import 'package:subero_mobile/ui/widgets/bubble/bubble_border.dart';

class QuestionAndAnswer extends StatelessWidget {
  final String text = 'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('よくある質問'),
      ),
      body: Container(
        constraints: BoxConstraints.expand(),
        height: 100,
        padding: EdgeInsets.all(16),
        margin: EdgeInsets.all(20),
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
          child: Column(
            children: [
              Text(text, overflow: TextOverflow.clip, softWrap: true),
              Text(text),
            ],
          ),
        ),
      ),
    );
  }
}
