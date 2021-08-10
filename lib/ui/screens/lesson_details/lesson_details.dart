import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:subero_mobile/ui/widgets/like_button.dart';

import 'widgets/index.dart';

class LessonDetails extends StatelessWidget {
  final String hostName = 'Toichi Shogo';
  final String hostIcon = 'images/icon_sample.png';
  final double rating = 5.0;
  final String lessonIcon = 'images/icon_sample.png';
  final List<String> tagNames = [
    '個人レッスン',
    '初心者',
    'グラトリ',
  ];
  final List<String> comments = ['複数人でのご利用も可能です', 'スノーボード上手ですか？', '上手です'];
  final List<String> userNames = ['Toichi Shogo', 'SuberoUser_1', 'Toichi Shogo'];
  final List<String> userIcons = [
    'images/icon_sample.png',
    'images/icon_sample.png',
    'images/icon_sample.png',
  ];
  final String titleText = '【初心者におすすめ】グラトリ入門3時間レッスン';
  final String description = '「グラトリをやってみたいけど，どうすればいいかわからない。」「始めてみたいけどいまいち上手くいかない。」といった方におすすめのレッスンです！\n\n私は5年のスノボ歴があり，誰にでも分かりやすい指導には定評があります！\n\nお悩みの方はぜひ受講してください！';
  final bool _isLiked = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('レッスン詳細')),
      body: SingleChildScrollView(
        child: ChangeNotifierProvider<_LikeButtonChangeNotifier>(
          create: (context) => _LikeButtonChangeNotifier(_isLiked),
          child: Stack(
            children: [
              Column(
                children: [
                  EyeCatch(lessonIcon),
                  LessonContents(titleText, tagNames, description, comments, userNames, userIcons),
                  Image.asset('images/lesson_detail_event.png'),
                ],
              ),
              Host(hostName, hostIcon, rating),
              // #todo: 位置の設定の見直し
              Positioned(child: LikeButton(30), top: 130, left: 330),
              Positioned(
                child: ElevatedButton(
                  // onPressed: () => Navigator.of(context).push(
                  //   MaterialPageRoute(
                  //     builder: (context) => BeforePurchasePage(),
                  //   ),
                  // ),
                  onPressed: () {},
                  child: Text('購入'),
                ),
                top: 30,
                left: 150,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// #todo: 状態管理
class _LikeButtonChangeNotifier extends ChangeNotifier {
  _LikeButtonChangeNotifier(this._isLiked);
  bool _isLiked;

  void toggle() {
    _isLiked = !_isLiked;
    // increment()が呼ばれると、Listenerたちに変更を通知する
    notifyListeners();
  }
}
