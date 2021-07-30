import '../../importer.dart';

class PostEvent extends StatelessWidget {
  PostEvent();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('イベントの投稿')),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Image.asset('images/event_post.png'),
          ],
        ),
      ),
    );
  }
}
