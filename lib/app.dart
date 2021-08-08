import 'package:flutter/material.dart';
import 'screens/index.dart';

// #todo: 現在のルートのアイコンを押したらルートの初期ページに直接移動できない
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // テーマの変更
      theme: ThemeData(
        // fontFamily: , // あれば指定
        primaryColor: Colors.white,

        // ボタンの色の初期設定
        buttonColor: Colors.black45,
        // buttonTheme: ButtonThemeData(textTheme: ButtonTextTheme.accent),
        accentColor: Colors.green,
      ),

      home: _MyApp(),
    );
  }
}

// タブの設定
class _MyApp extends StatefulWidget {
  const _MyApp({Key? key}) : super(key: key);

  @override
  __MyAppState createState() => __MyAppState();
}

class __MyAppState extends State<_MyApp> {
  // Widgetを切り替えるためのインデックス
  int _currentIndex = 0;
  // タブバー内に設定するWidgetの設定
  final _pageWidgets = [
    Home(),
    Search(),
    Post(),
    Message(),
    MyPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pageWidgets.elementAt(_currentIndex), // _pageWidgetの現在のインデックスのWidgetをbodyに設定
      // タブバーの設定
      bottomNavigationBar: BottomNavigationBar(
        // タブバー内のアイコン，文字の設定
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'ホーム'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: '検索'),
          BottomNavigationBarItem(icon: Icon(Icons.add_box), label: '投稿'),
          BottomNavigationBarItem(icon: Icon(Icons.message_outlined), label: 'メッセージ'),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'マイページ'),
        ],
        currentIndex: _currentIndex, // 現在のインデックスの入力
        fixedColor: Colors.greenAccent, // 選択時の色の設定
        onTap: (int index) {
          setState(() => {_currentIndex = index});
        }, // 押されたときの処理の設定
        type: BottomNavigationBarType.fixed, // ?
      ),
    );
  }
}
