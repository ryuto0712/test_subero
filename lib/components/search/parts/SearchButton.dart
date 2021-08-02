import '../../../importer.dart';

class SearchButton extends StatelessWidget {
  SearchButton();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ElevatedButton(
        onPressed: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => SearchedPage())),
        child: Text('検索'),
      ),
    );
  }
}
