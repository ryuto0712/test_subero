import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:subero_mobile/controller/lesson_post/lesson_post_controller.dart';

// TODO: ドロップダウンの選択結果が表示できない
// TODO: タグ複数選択の実装
// TODO: イベント日時の選択をましにする

class PostInfomationList extends StatelessWidget {
  final LessonPostController c = Get.find<LessonPostController>();
  final List<String> listNames = [
    'カテゴリ',
    'タグ',
    'スキー場',
    'イベント日時',
  ];
  static const List<String> _categoryList = ['カテゴリ1', 'カテゴリ2', 'カテゴリ3'];
  static const List<String> _tagList = [
    '初心者',
    '中級者',
    '個人レッスン',
    'グループレッスン',
    'グラトリ',
    'パーク',
    'フリーラン'
  ];
  static const List<String> _skiResorts = [
    '志賀高原スキー場',
    'ニセコユナイテッド',
    '蔵王温泉スキー場',
    '苗場スキー場',
    '野沢温泉スキー場',
    '竜王スキーパーク',
    '白馬八方尾根スキー場',
    '舞子スノーリゾート',
    'GALA湯沢スキー場',
    'ダイナランド',
  ];
  static const List<String> _dateList = [
    '12/25 13:00~',
    '1/10 12:00~',
    '1/13 14:00~'
  ];
  // static const String _defaultValue = '未選択 >';
  static const List<List<String>> _lists = [
    _categoryList,
    _tagList,
    _skiResorts,
    _dateList
  ];

  late final List<dynamic> cList;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
          border:
              Border(top: BorderSide(width: 1, color: Colors.grey.shade400))),
      child: Column(
        children: [for (int i = 0; i < listNames.length; i++) _bottomList(i)],
      ),
    );
  }

  Widget _bottomList(int i) {
    return GestureDetector(
      onTap: () => {},
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        height: 40,
        alignment: Alignment.centerLeft,
        decoration: BoxDecoration(
          border:
              Border(bottom: BorderSide(width: 1, color: Colors.grey.shade400)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(listNames[i],
                style: TextStyle(fontSize: 14, color: Colors.grey[700])),
            MyDropDown(_lists[i], i),
          ],
        ),
      ),
    );
  }
}

class MyDropDown extends StatefulWidget {
  final List<String> _list;
  final int i;
  MyDropDown(this._list, this.i);

  @override
  _MyDropDownState createState() => _MyDropDownState();
}

class _MyDropDownState extends State<MyDropDown> {
  final LessonPostController c = Get.find();
  final _defaultValue = ['未選択', '未選択', '未選択', '未選択'];

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      // value: _defaultValue[widget.i],  // ここがどうにも
      icon: Icon(Icons.arrow_drop_down),
      iconSize: 30,
      elevation: 16,
      style: TextStyle(fontSize: 20, color: Colors.black),
      underline: Container(height: 2, color: Colors.grey),
      onChanged: (newValue) => {_choice(widget.i, newValue!)},
      items: widget._list.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }

  void _choice(int i, String value) {
    if (i == 0)
      c.lesson.category = value;
    else if (i == 1)
      c.lesson.tags = [value];
    else if (i == 2)
      c.lesson.skiResort = value;
    else if (i == 3) c.lesson.date = value;

    setState(() {
      _defaultValue[i] = value;
    });
  }
}
