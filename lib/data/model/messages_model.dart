import 'package:cloud_firestore/cloud_firestore.dart';

// TODO: 名前（MessagesModel, MessegeModel）が紛らわしいので変更
// TODO: MessagesModelの未使用変数の使用or削除

class MessagesModel {
  late String messagesId;
  // late String lessonType;
  // late bool trading;
  // late String status;
  late String lessonId;
  late String lessonName;
  late String lessonImage;
  late String lessonDate;

  late String hostId;
  late String hostName;
  late String hostIcon;

  late String buyerId;
  late String buyerName;
  late String buyerIcon;

  late DateTime createdAt;

  // late List<MessageModel> buyers;

  late List<MessageModel> messages;

  // static const List<MessageModel> initBuyers = [];
  static const List<MessageModel> initMessages = [];

  MessagesModel({
    this.messagesId: '',
    // this.lessonType: '',
    // this.trading: false,
    // this.status: '',
    this.lessonId: '',
    this.lessonName: '',
    this.lessonImage: '',
    this.lessonDate: '',
    this.hostId: '',
    this.hostName: '',
    this.hostIcon: '',
    this.buyerId: '',
    this.buyerName: '',
    this.buyerIcon: '',
    // this.buyers: initBuyers,
    this.messages: initMessages,
  });

  MessagesModel.fromDocumentSnapshot({required DocumentSnapshot documentSnapshot}) {
    this.messagesId = documentSnapshot.id;
    // this.lessonType = documentSnapshot['lesson_type'];
    // this.trading = documentSnapshot['trading'];
    // this.status = documentSnapshot['status'];
    this.lessonId = documentSnapshot['lesson_id'];
    this.lessonName = documentSnapshot['lesson_name'];
    this.lessonImage = documentSnapshot['lesson_image_url'];
    this.lessonDate = documentSnapshot['lesson_date'];
    this.hostId = documentSnapshot['host_id'];
    this.hostName = documentSnapshot['host_name'];
    this.hostIcon = documentSnapshot['host_icon_url'];
    this.buyerId = documentSnapshot['buyer_id'];
    this.buyerName = documentSnapshot['buyer_name'];
    this.buyerIcon = documentSnapshot['buyer_icon_url'];
    this.createdAt = documentSnapshot['created_at'].toDate();

    // final _buyers = documentSnapshot['buyers'];
    // this.buyers = [for (int i = 0; i < _buyers.length; i++) MessageModel.fromMap(map: _buyers[i])];
    final _messages = documentSnapshot['messages'];
    this.messages = [for (int i = 0; i < _messages.length; i++) MessageModel.fromMap(map: _messages[i])];
  }
}

class MessageModel {
  late bool isHost;
  late String contents;
  late DateTime createdAt;

  MessageModel({
    this.isHost: false,
    this.contents: '',
  });

  MessageModel.fromMap({required Map map}) {
    this.isHost = map['is_host'];
    this.contents = map['contents'];
    this.createdAt = map['created_at'].toDate();
  }
}
// class MessageModel {
//   late String userId;
//   late String userName;
//   late String userIcon;
//   late DateTime appliedAt;

//   MessageModel({
//     this.userId: '',
//     this.userName: '',
//     this.userIcon: '',
//   });

//   MessageModel.fromMap({required Map map}) {
//     this.userId = map['user_id'];
//     this.userName = map['user_name'];
//     this.userIcon = map['user_icon'];
//     this.appliedAt = map['applied_at'].toDate();
//   }
// }
