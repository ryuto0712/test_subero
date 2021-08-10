import 'package:flutter/material.dart';
import 'package:subero_mobile/ui/screens/index.dart';

class BottomList extends StatelessWidget {
  const BottomList({Key? key}) : super(key: key);
  static const List<String> buttonName1 = [
    'いいね一覧',
    'アカウント設定',
    '通知設定',
  ];
  static const List<String> buttonName2 = [
    'よくある質問',
    'ガイド',
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          _backGround(),
          for (int i = 0; i < 3; i++) _bottomList(context, buttonName1[i]),
          _backGround(),
          for (int i = 0; i < 2; i++) _bottomList(context, buttonName2[i]),
          _backGround(),
        ],
      ),
    );
  }

  Widget _bottomList(BuildContext context, String text) {
    return GestureDetector(
      onTap: () => onTap(context, text),
      child: Container(
        height: 40,
        width: 400, // #todo: 幅の設定
        alignment: Alignment.centerLeft,
        decoration: BoxDecoration(
          border: Border(bottom: BorderSide(width: 1, color: Colors.grey.shade400)),
        ),
        child: Container(
          margin: EdgeInsets.only(left: 40),
          child: Text(text, style: TextStyle(fontSize: 14, color: Colors.grey[700])),
        ),
      ),
    );
  }

  Widget _backGround() {
    return Container(
      height: 10,
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(width: 1, color: Colors.grey.shade400)),
        color: Colors.grey[200],
      ),
    );
  }

  // onTap(BuildContext context, String text) {
  //   print('$text was tapped.');
  // }
  onTap(BuildContext context, String text) {
    switch (text) {
      case 'いいね一覧':
        return Navigator.of(context).push(MaterialPageRoute(builder: (context) => IineList()));

      case 'アカウント設定':
        return Navigator.of(context).push(MaterialPageRoute(builder: (context) => AccountConfig()));

      case '通知設定':
        return Navigator.of(context).push(MaterialPageRoute(builder: (context) => NotificationConfig()));

      case 'よくある質問':
        return Navigator.of(context).push(MaterialPageRoute(builder: (context) => QuestionAndAnswer()));

      case 'ガイド':
        return Navigator.of(context).push(MaterialPageRoute(builder: (context) => Guide()));
    }
  }
}
