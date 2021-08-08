import '../../../importer.dart';

class SearchList extends StatelessWidget {
  SearchList();
  List<String> caption = ['ジャンル', 'エリア', '講師', '日付'];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      // child: Text('test'),
      child: ListView(
        children: [
          for (int i = 0; i < caption.length; i++) tile(context, i),
        ],
      ),
    );
  }

  Widget tile(BuildContext context, int i) {
    double height = 35;
    if (i == 0) {
      return GestureDetector(
        onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => SearchedPage())),
        child: Container(
          height: height,
          decoration: BoxDecoration(border: Border.symmetric(horizontal: BorderSide(color: Colors.grey.shade300, width: 1))),
          child: Container(margin: EdgeInsets.fromLTRB(height / 2, height / 5, 0, 0), child: Text(caption[i] + 'からさがす')),
        ),
      );
    } else {
      return GestureDetector(
        onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => SearchedPage())),
        child: Container(
          height: height,
          decoration: BoxDecoration(border: Border(bottom: BorderSide(color: Colors.grey.shade300, width: 1))),
          child: Container(margin: EdgeInsets.fromLTRB(height / 2, height / 5, 0, 0), child: Text(caption[i] + 'からさがす')),
        ),
      );
    }
  }
}
