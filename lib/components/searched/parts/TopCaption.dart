import '../../../importer.dart';

class TopCaption extends StatelessWidget {
  TopCaption();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            child: Text('新潟県，〜3000円の検索結果'),
          ),
          Container(
            child: Column(
              children: [
                Container(
                  child: Text('新着順'),
                ),
                Container(
                  child: Text('絞り込み'),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
