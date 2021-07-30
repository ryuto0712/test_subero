import '../../importer.dart';

class IndividualMessage extends StatelessWidget {
  IndividualMessage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('個人メッセージ')),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Image.asset('images/individual_message.png'),
          ],
        ),
      ),
    );
  }
}
