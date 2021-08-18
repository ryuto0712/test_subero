import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:subero_mobile/data/model/messages_model.dart';

// TODO: cloud storageへの画像のアップロード
// TODO: 購入時にmessagesコレクションに新規ドキュメントを作成?
// TODO: 購入者の全体メッセージはlessons内のドキュメント内にpurchased_comments[array]とかでいれる？

class MessagesProvider extends GetConnect {
  final CollectionReference messages = FirebaseFirestore.instance.collection('messages');
  firebase_storage.FirebaseStorage storage = firebase_storage.FirebaseStorage.instance;

  Future<MessagesModel> getMessages(String messagesId) async {
    try {
      DocumentSnapshot _doc = await this.messages.doc(messagesId).get();
      var messages = MessagesModel.fromDocumentSnapshot(documentSnapshot: _doc);
      return messages;
    } catch (e) {
      print('Messages Provider Error: $e');
      rethrow;
    }
  }

  Future<void> addMessage(String messagesId, MessageModel message) {
    return this.messages.doc(messagesId).update({
      'messages': FieldValue.arrayUnion([
        {
          'is_host': message.isHost,
          'contents': message.contents,
          // 'message_type': message.messageType,
          // 'image_url': message.imageUrl,
          'created_at': message.createdAt,
        }
      ])
    });
  }
}
