# Flutter

https://flutter.dev/

settings.json
```dart
  "[dart]": {
    "editor.defaultFormatter": "Dart-Code.dart-code"
  },
  "dart.lineLength": 200, //行折り返しの長さ
  "editor.formatOnPaste": true,
```

- Widgetを選択 -> Ctrl + '.' でWrap可能

- スニペット作成
  https://www.lisz-works.com/entry/vscode-snippets

## 色の指定

- RGBO で指定
  `Color.fromRGBO`
- Colors から指定
  `Colors.orange`

## アイコン設定

- Icons から指定 https://api.flutter.dev/flutter/material/Icons-class.html
  `Icons.icon_name`

## Widgets

- `MaterialWidget` アプリケーション全体を管理するための部品
  主に全体のデザインや画面遷移をする場合の状態監視、そして、アプリケーション全体のタイトルやその全体にかかわるプロパティの管理しています。

  - `title`: タイトルを指定．どこに反映される？
  - `theme`: ThemeData(
    - `primarySwatch`: アプリのテーマとなる色を指定
      )
  - `home`: MyHomePage とかを指定

- `Scaffold` 画面全体を構成するための部品.
- ``

## その他

- フローティングボタン
  ```dart
  floatingActionButton: FloatingActionButton(
    onPressed: _incrementCounter,  // 押されたときの処理
    tooltip: 'Increment',  //  これは何？
    child: Icon(Icons.~~~),
  ),
  ```

## ライブラリ管理

flutter のライブラリ管理は pubspec.yaml で行う．

## ルーティング

https://itome.team/blog/2019/12/flutter-advent-calendar-day10/
ほとんどの場合 MaterialApp が持っている Navigator を使って画面遷移します。

## ファイル構成

lib
├ common : よく使う共通 Widget
├ ├ Widget.dart
├ └ index.dart
├ components : 各ページの中身
| ├ home/
| | ├ parts/
| | | ├ Parts.dart : パーツのwidget
| | | └ index.dart : Home.dartでインポートする用
| | └ Home.dart
| ├ search/Search.dart
| └ ~~~/~~~.dart
├ Pages : ページ構成
| ├ Home.dart
| ├ Search.dart
| └ index.dart
├ models/ : モデルクラスを配置
├ importer.dart : パッケージ，components/index.dart, Pages/index.dart等をexport
├ app.dart
└ main.dart

webで見たやつ
lib
├ common : よく使う共通 Widget
├ components : ページ構成
| ├ home/
| ├ goods/
| ├ app.dart
| └ importer.dart
├ configs : グローバルな変数/定数を扱う
├ helpers : static な関数を配置
├ models : モデルクラスを配置
├ repositories : DB アクセスを使用するアプリの場合には Repository を配置
├ routes : ルーティングの設定をここに配置
├ services : サービスをここに配置
└ main.dart

## 参考 URL

- tab 作成 https://qiita.com/hiiragi252/items/47e458ca0c89b96ddac5
- コード解説 https://hisurga.hatenablog.com/entry/2019/06/16/220755
- 画面遷移 https://qiita.com/code-cutlass/items/f8a19878a215f2f932a9
- 検索バー https://www.fixes.pub/program/481553.html
- Firebase 検索 https://ichi.pro/elasticsearch-firebase-flutter-de-kensaku-kino-o-jissosuru-31625635799283
- Flutter Doc JP https://flutter.ctrnost.com/
- 初めての Flutter アプリの作成（パート 2） https://codelabs.developers.google.com/codelabs/first-flutter-app-pt2#0
- 自作アイコン https://techracho.bpsinc.jp/wingdoor/2020_06_05/92667
- UI https://codezine.jp/article/detail/13329?mode=print
- 関数・クラス https://codezine.jp/article/detail/13586?mode=print
- ディレクトリ構成 https://qiita.com/tanakeiQ/items/2c4a7fcb8e95b9aa55ad
- widget 一覧 https://qiita.com/matsukatsu/items/e289e30231fffb1e4502
- 通知設定 https://qiita.com/1d7678174656/items/0c2f233d70e7b678e2f7
- firebase https://gurutaka-log.com/flutter-firebase-firestore-sample
- firebase https://qiita.com/engineerhikaru/items/695caee92f7a10660624
- firebase https://qiita.com/smiler5617/items/8dcf720f5477a5f4b7d7
- firestore 公式 https://firebase.flutter.dev/docs/firestore/usage/#read-data
- 起動時のみ実行 https://qiita.com/yu124choco/items/b518a2757ce6d7d00134
- dart list https://note.com/hatchoutschool/n/n01618da1a548
- routing https://omohikane.com/futter_routes_materialpageroute/
- theme https://itome.team/blog/2019/12/flutter-advent-calendar-day12/
- text https://qiita.com/LikeGeohotz/items/f3129cedbee7ba788316
