import '../../importer.dart';
import 'parts/index.dart';

class Search extends StatelessWidget {
  const Search({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('検索')),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SearchList(),
            SearchButton(),
            Image.asset('images/search.png'),
          ],
        ),
      ),
    );
  }
}
