import 'package:cloud_firestore/cloud_firestore.dart';

class CommentModel {
  late String userId;
  late String userName;
  late String userIcon;
  late String contents;
  late DateTime? createdAt;

  CommentModel({
    userId: '',
    userName: '',
    userIcon: 'images/app_icon.png',
    contents: '',
    createdAt,
  });

  CommentModel.fromMap({required Map comment}) {
    this.userId = comment['user_id'];
    this.userName = comment['user_name'];
    this.userIcon = comment['user_icon_url'];
    this.contents = comment['contents'];
    this.createdAt = comment['created_at'].toDate(); // Timestamp->DateTimeへの変換
  }
}
