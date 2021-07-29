import '../importer.dart';

class Searched extends StatelessWidget {
  Searched();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('検索画面')),
      body: SingleChildScrollView(
        child: Image.asset('images/searched.png'),
      ),
    );
  }
}
