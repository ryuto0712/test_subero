import 'package:flutter/material.dart';
import 'package:subero_mobile/data/model/comment_model.dart';
import 'package:subero_mobile/ui/widgets/index.dart';

class Comment extends StatelessWidget {
  final CommentModel comment;
  Comment({required this.comment});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 7),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 40,
            height: 40,
            margin: EdgeInsets.only(top: 12),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: Colors.grey, width: 1),
              image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage(comment.userIcon),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.only(left: 12, bottom: 2),
                  child: Text(comment.userName, style: TextStyle(color: Colors.grey.shade600, fontSize: 12)),
                ),
                Container(
                    // padding: EdgeInsets.all(10),
                    // color: Colors.grey.shade400,
                    child: Bubble(comment.contents, fromAtNow(comment.createdAt!)))
              ],
            ),
          )
        ],
      ),
    );
  }
}

// 現在の時刻からの差を表示
String fromAtNow(DateTime date) {
  final Duration difference = DateTime.now().difference(date);
  final int sec = difference.inSeconds;

  if (sec >= 60 * 60 * 24) {
    return '${difference.inDays.toString()}日前';
  } else if (sec >= 60 * 60) {
    return '${difference.inHours.toString()}時間前';
  } else if (sec >= 60) {
    return '${difference.inMinutes.toString()}分前';
  } else {
    return '$sec秒前';
  }
}
