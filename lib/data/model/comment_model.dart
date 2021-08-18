import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:subero_mobile/data/model/messages_model.dart';

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

  CommentModel.fromMap({required Map map}) {
    this.userId = map['user_id'];
    this.userName = map['user_name'];
    this.userIcon = map['user_icon_url'];
    this.contents = map['contents'];
    this.createdAt = map['created_at'].toDate(); // Timestamp->DateTimeへの変換
  }

  CommentModel.fromMessagesModel({required MessageModel messageModel, required MessagesModel messagesModel}) {
    messageModel.isHost
        ? {
            this.userId = messagesModel.hostId,
            this.userName = messagesModel.hostName,
            this.userIcon = messagesModel.hostIcon,
          }
        : {
            this.userId = messagesModel.buyerId,
            this.userName = messagesModel.buyerName,
            this.userIcon = messagesModel.buyerIcon,
          };
    this.createdAt = messageModel.createdAt;
    this.contents = messageModel.contents;
  }
}
