import '../importer.dart';

class Post extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('投稿')),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              ElevatedButton(
                onPressed: () => {Navigator.of(context).push(MaterialPageRoute(builder: (context) => PostPermanentLessonPage()))},
                child: Text('常設レッスンの投稿'),
              ),
              ElevatedButton(
                onPressed: () => {Navigator.of(context).push(MaterialPageRoute(builder: (context) => PostEventPage()))},
                child: Text('イベントの投稿'),
              ),
              Image.asset('images/post.png'),
            ],
          ),
        ),
      ),
    );
  }
}
