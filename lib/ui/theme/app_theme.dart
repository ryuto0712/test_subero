import 'package:flutter/material.dart';

final ThemeData appThemeData = ThemeData(
  // * 色の設定
  primaryColor: Colors.white,
  accentColor: Colors.green,

  // * テキストの設定
  // fontFamily: 'Georgia',
  // textTheme: TextTheme(
  //   headline1: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
  // ),

  // * ボタンの色の初期設定(機能していない？)
  buttonColor: Colors.black45,
  // buttonTheme: ButtonThemeData(textTheme: ButtonTextTheme.accent),

  // * 画面遷移の設定
  pageTransitionsTheme: PageTransitionsTheme(
    builders: <TargetPlatform, PageTransitionsBuilder>{
      TargetPlatform.android: CupertinoPageTransitionsBuilder(), // 横遷移になってない？
      TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
    },
  ),

  // * その他の設定
);
