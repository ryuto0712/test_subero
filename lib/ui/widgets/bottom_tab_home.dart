import 'package:flutter/material.dart';
import 'package:subero_mobile/ui/screens/index.dart';

// #todo 投稿ボタンを表示するかどうかの判断

class BottomTabHome extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _BottomTabHomeState();
  }
}

class _BottomTabHomeState extends State<BottomTabHome> {
  // Widgetを切り替えるためのインデックス
  int _currentIndex = 0;
  // タブバー内に設定するWidgetの設定
  final _pageWidgets = [Home(), Search(), Post(), Message(), Mypage()];

  // stateの更新
  // _pageWidgetsのインデックスを切り替えることでページの切り替えを実装
  void _onItemTapped(int index) => setState(() => _currentIndex = index);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('Subero mobile'),
      // ),
      body: _pageWidgets.elementAt(_currentIndex), // _pageWidgetの現在のインデックスのWidgetをbodyに設定
      // タブバーの設定
      bottomNavigationBar: BottomNavigationBar(
        // タブバー内のアイコン，文字の設定  #todo 自作アイコンの設定
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), title: Text('ホーム')),
          BottomNavigationBarItem(icon: Icon(Icons.search), title: Text('検索')),
          BottomNavigationBarItem(icon: Icon(Icons.add_box), title: Text('投稿')),
          BottomNavigationBarItem(icon: Icon(Icons.message_outlined), title: Text('メッセージ')),
          BottomNavigationBarItem(icon: Icon(Icons.settings), title: Text('マイページ')),
        ],
        currentIndex: _currentIndex, // 現在のインデックスの入力
        fixedColor: Colors.blueAccent, // 選択時の色の設定
        onTap: _onItemTapped, // 押されたときの処理の設定
        type: BottomNavigationBarType.fixed, // ?
      ),
    );
  }
}
