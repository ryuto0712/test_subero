import 'package:flutter/material.dart';
import './newview1.dart';  //★１ 外出ししたファイルのインポー

class Test extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: RaisedButton(
          child: Text('ボタン'),
          //★２ 画面遷移のボタンイベント
          onPressed: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) {
            return NewView1();
          })),
          //★２追加ここまで
        ),
      );
  }
}
