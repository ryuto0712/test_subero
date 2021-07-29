import '../components/importer.dart';


// class PlaceSeaarchBar extends StatefulWidget {
//   // PlaceSeaarchBar({Key key}) : super(key: key);

//   @override
//   _PlaceSeaarchBarState createState() => _PlaceSeaarchBarState();
// }

// class _PlaceSeaarchBarState extends State {
//   var _itemsizeheight = 65.0;
//   var posSelected = 0;

//   final _searchBarController = SearchBarController();

//   List<String> exampleList = [
//     'Axvfgfdg',
//     'Axvfgfdg3',
//     'Bsdadasd',
//     'Axvfgfdg2',
//     'Bsdadasd3',
//     'Cat',
//     'Bsdadasd2',
//     'Cat2',
//     'Cat3',
//     'Dog',
//     'Dog2',
//     'Dog3',
//     'Elephant',
//     'Elephant2',
//     'Elephant3',
//     'Fans',
//     'Girls',
//     'Hiiii',
//     'Ilu',
//     'Jeans',
//     'Kite',
//     'Lion',
//     'Men',
//     'Nephow',
//     'Owl',
//     'Please',
//     'Quat',
//     'Rose',
//     'Salt',
//     'Trolly',
//     'Up',
//     'View',
//     'Window',
//     'Xbox',
//     'Yellow',
//     'Yummy',
//     'Zubin',
//     'Zara',
//     'Fans2',
//     'Girls2',
//     'Hiiii2',
//     'Ilu2',
//     'Jeans2',
//     'Kite2',
//     'Lion2',
//     'Men2',
//     'Nephow2',
//     'Owl2',
//     'Please2',
//     'Quat2',
//     'Rose2',
//     'Salt2',
//     'Trolly2',
//     'Up2',
//     'View2',
//     'Window2',
//     'Xbox2',
//     'Yellow2',
//     'Yummy2',
//     'Zubin2',
//     'Zara2',
//     'あいうえお',
//     '12345'
//   ];

//   @override
//   void initState() {
//     exampleList.sort((a, b) {
//       return a.toString().compareTo(b.toString());
//     });
//     super.initState();
//   }

//   // 検索する文字を含む文字列のリストを返す
//   Future<List<String>> _search(String text) async {
//     var tmpList = [];

//     tmpList.addAll(
//       exampleList.where(
//         (element) => element.contains(text),
//       ),
//     );
//     return tmpList;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//         child: SearchBar<String>(
//           searchBarPadding: EdgeInsets.symmetric(horizontal: 10), 
//           minimumChars: 1,    //検索時の最小文字数
//           hintText: "検索",
//           cancellationWidget: Text("キャンセル"),
//           onSearch: _search,
//           placeHolder: Center(      //デフォルトで表示する内容
//             child: ListView.builder(
//               itemCount: exampleList.length,
//               itemExtent: _itemsizeheight,
//               itemBuilder: (context, position) {
//                 return Card(
//                   child: Padding(
//                     padding: const EdgeInsets.all(16.0),
//                     child: Text(
//                       exampleList[position],
//                       style: TextStyle(fontSize: 20.0),
//                     ),
//                   ),
//                 );
//               },
//             ),
//           ),
//           //検索文字を含んでいた文字列をCardで表示
//           onItemFound: (String word, int index) {
//             return Card(
//               child: Padding(
//                 padding: const EdgeInsets.all(20.0),
//                 child: Text(
//                   word,
//                   style: TextStyle(fontSize: 14.0),
//                 ),
//               ),
//             );
//           },
//           // 検索時のローディング
//           loader: Center(
//             child: Text("loading..."),
//           ),
//           // 検索でエラーになった時
//           onError: (error) {
//             print(error);
//             return Center(
//               child: Text("Error occurred : $error"),
//             );
//           },
//         ),
//       ),
//     );
//   }
// }






class _Post {
  final String title;
  final String body;

  _Post(this.title, this.body);
}



class PlaceSearchBar extends StatefulWidget {
  @override
  _PlaceSearchBarState createState() => _PlaceSearchBarState();
}

class _PlaceSearchBarState extends State<PlaceSearchBar> {
  // final SearchBarController<_Post> _searchBarController = SearchBarController();
  // bool isReplay = false;

  // Future<List<_Post>> _getALl_Posts(String? text) async {
  //   await Future.delayed(Duration(seconds: text!.length == 4 ? 10 : 1));
  //   if (isReplay) return [_Post("Replaying !", "Replaying body")];
  //   if (text.length == 5) throw Error();
  //   if (text.length == 6) return [];
  //   List<_Post> _Posts = [];

  //   var random = new Random();
  //   for (int i = 0; i < 10; i++) {
  //     _Posts.add(
  //       _Post("$text $i", "body random number : ${random.nextInt(100)}"),
  //     );
  //   }
  //   return _Posts;
  // }

  // Widget _searchList(BuildContext context, Object? searchList, int index) {
  //   if (searchList is List) {
  //   return ListTile(
  //      title: Text(searchList.elementAt(index)), // 候補リストのListTileを生成
  //   );
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: SearchBar(
        onSearch: search,
        minimumChars: 1,  // 検索結果を表示する最小の文字数の指定
        onItemFound: (myList, int index) {
          return ListTile();
          // return ListView.builder(
            // itemCount: 5,  // 表示する長さの指定
            // itemBuilder: (BuildContext context, int index){
              // return _searchList(context, myList, index);
            // }
            // アプリ情報から必要な情報を取得して画面に表示する処理を行っています。
          // );
        },
        hintText: 'レッスンを探す',
      ),
    );
  }

  /// 検索対象のアプリ情報を検索しています。
  Future<List<String>> search(String? search) async {
    final apps = ['Youtube', 'Google map', 'Chrome', 'LINE'];
    if (search != null) {
      var searchApps = apps
          .where(
              (app) =>
              app.contains(search))
          .toList();
      return searchApps;
    }
    else{
      var searchApps = [''];
      return searchApps;
    }
  }

  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     body: SafeArea(
  //       child: SearchBar<_Post>(
  //         searchBarPadding: EdgeInsets.symmetric(horizontal: 10),
  //         headerPadding: EdgeInsets.symmetric(horizontal: 10),
  //         listPadding: EdgeInsets.symmetric(horizontal: 10),
  //         onSearch: _getALl_Posts,
  //         searchBarController: _searchBarController,
  //         onError: (error) => Text('ERROR: ${error.toString()}'),
  //         placeHolder: Text("placeholder"),
  //         cancellationWidget: Text("Cancel"),
  //         emptyWidget: Text("empty"),
  //         indexedScaledTileBuilder: (int index) =>
  //             ScaledTile.count(1, index.isEven ? 2 : 1),
  //         header: Row(
  //           children: <Widget>[
  //             TextButton(
  //               child: Text("sort"),
  //               onPressed: () {
  //                 _searchBarController.sortList((_Post a, _Post b) {
  //                   return a.body.compareTo(b.body);
  //                 });
  //               },
  //             ),
  //             TextButton(
  //               child: Text("Desort"),
  //               onPressed: () {
  //                 _searchBarController.removeSort();
  //               },
  //             ),
  //             TextButton(
  //               child: Text("Replay"),
  //               onPressed: () {
  //                 isReplay = !isReplay;
  //                 _searchBarController.replayLastSearch();
  //               },
  //             ),
  //           ],
  //         ),
  //         onCancelled: () {
  //           print("Cancelled triggered");
  //         },
  //         mainAxisSpacing: 10,
  //         crossAxisSpacing: 10,
  //         crossAxisCount: 2,
  //         onItemFound: (_Post? _Post, int index) {
  //           return Container(
  //             color: Colors.lightBlue,
  //             child: ListTile(
  //               title: Text(_Post!.title),
  //               isThreeLine: true,
  //               subtitle: Text(_Post.body),
  //               onTap: () {
  //                 Navigator.of(context)
  //                     .push(MaterialPageRoute(builder: (context) => Detail()));
  //               },
  //             ),
  //           );
  //         },
  //       ),
  //     ),
  //   );
  // }
}

class Detail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () => Navigator.of(context).pop(),
            ),
            Text("Detail"),
          ],
        ),
      ),
    );
  }
}
