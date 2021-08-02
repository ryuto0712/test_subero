import '../../importer.dart';
import 'parts/index.dart';

class Searched extends StatelessWidget {
  Searched();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('検索画面')),
      body: SingleChildScrollView(
        child: Column(
          children: [
            TopCaption(),
            SearchedLessons(400),
            Image.asset('images/searched.png'),
          ],
        ),
      ),
    );
  }
}
