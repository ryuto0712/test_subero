import '../../importer.dart';

class Search extends StatelessWidget {
  const Search({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('検索')),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // PlaceSearchBar(),
            ElevatedButton(
              onPressed: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => SearchedPage())),
              child: Text('検索'),
            ),
            Image.asset('images/search.png'),
          ],
        ),
      ),
    );
  }
}
