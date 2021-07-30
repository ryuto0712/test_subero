import '../../importer.dart';

class NewPost extends StatelessWidget {
  NewPost();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        child: Column(
          children: <Widget>[
            Text('新規投稿'),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                postLesson(context),
                postEvent(context),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget postLesson(BuildContext context) {
    return Container(
      child: GestureDetector(
        onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => PostPermanentLessonPage())),
        child: Card(
          child: Column(
            children: <Widget>[
              Text('常設レッスン'),
              Icon(Icons.ac_unit),
              Text('お客様が日付を指定して\n予約ができます'),
            ],
          ),
        ),
      ),
    );
  }

  Widget postEvent(BuildContext context) {
    return Container(
      child: GestureDetector(
        onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => PostEventPage())),
        child: Card(
          child: Column(
            children: <Widget>[
              Text('イベント'),
              Icon(Icons.ac_unit),
              Text('時間を指定したイベントを\n投稿できます'),
            ],
          ),
        ),
      ),
    );
  }
}
