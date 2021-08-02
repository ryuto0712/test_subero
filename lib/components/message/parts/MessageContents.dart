import 'package:video_player/video_player.dart';

import '../../../importer.dart';
import 'index.dart';

class MessageContents extends StatefulWidget {
  const MessageContents();

  @override
  _MessageContentsState createState() => _MessageContentsState();
}

class _MessageContentsState extends State<MessageContents> {
  bool onGoing = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          if (onGoing) toggleButtonsOnGoing(context) else toggleButtonsFinished(context),
          if (onGoing) OnGoingLesson() else OnGoingLesson(),
        ],
      ),
    );
  }

// #todo: いい感じの切り替えボタンのwidgetを使用する
  Widget toggleButtonsOnGoing(BuildContext context) {
    double height = 50;
    double width = 150;
    return Container(
      height: height,
      decoration: BoxDecoration(
        border: Border.symmetric(
          horizontal: BorderSide(color: Colors.grey.shade300, width: 1),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          GestureDetector(
            onTap: () => setState(() => onGoing = true),
            child: Container(
              height: height,
              width: width,
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(color: Colors.green, width: 2),
                ),
              ),
              child: Center(child: Text('進行中のレッスン')),
            ),
          ),
          SizedBox(width: 10),
          GestureDetector(
            onTap: () => setState(() => onGoing = false),
            child: Container(
              width: width,
              height: height,
              child: Center(child: Text('終了したレッスン')),
            ),
          ),
        ],
      ),
    );
  }

  Widget toggleButtonsFinished(BuildContext context) {
    double height = 50;
    double width = 150;
    return Container(
      height: height,
      decoration: BoxDecoration(
        border: Border.symmetric(
          horizontal: BorderSide(color: Colors.grey.shade300, width: 1),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          GestureDetector(
            onTap: () => setState(() => onGoing = true),
            child: Container(
              height: height,
              width: width,
              child: Center(child: Text('進行中のレッスン')),
            ),
          ),
          SizedBox(width: 10),
          GestureDetector(
            onTap: () => setState(() => onGoing = false),
            child: Container(
              width: width,
              height: height,
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(color: Colors.green, width: 2),
                ),
              ),
              child: Center(child: Text('終了したレッスン')),
            ),
          ),
        ],
      ),
    );
  }
}
