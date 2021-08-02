import '../../importer.dart';
import 'parts/index.dart';

class Message extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('メッセージ')),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            ElevatedButton(
              onPressed: () => Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => IndividualMessagePage(),
                ),
              ),
              child: Text('個別メッセージ'),
            ),
            MessageContents(),
            Image.asset('images/message.png'),
          ],
        ),
      ),
    );
  }
}
