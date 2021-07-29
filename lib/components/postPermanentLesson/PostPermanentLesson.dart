import '../importer.dart';

class PostPermanentLesson extends StatelessWidget {
  PostPermanentLesson();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('常設レッスン投稿'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Image.asset('images/post_permanent_lesson.png'),
          ],
        ),
      ),
    );
  }
}
