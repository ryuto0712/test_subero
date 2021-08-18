import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:subero_mobile/data/model/messages_model.dart';
import 'package:subero_mobile/data/repository/messages_repository.dart';

class MessagesController extends GetxController {
  final GetStorage box = GetStorage();

  final MessagesRepository repository;
  MessagesController(this.repository);

  final _messages = MessagesModel().obs;
  // set messages(value) => this._messages.value = value;
  get messages => _messages.value;

  final MessageModel _postMessage = MessageModel();

  getMessages(String messagesId) async {
    try {
      this._messages.value = await repository.getMessages(messagesId);
    } catch (e) {
      print('Message Controller Error: $e');
    }
  }

  addMessage(String contents) async {
    try {
      _postMessage.isHost = box.read('userId') == _messages.value.hostId;
      _postMessage.contents = contents;
      _postMessage.createdAt = DateTime.now();

      await repository.addMessage(_messages.value.messagesId, _postMessage);

      this.getMessages(this._messages.value.messagesId);
    } catch (e) {
      print('メッセージ送信に失敗しました: $e');
    }
  }

  // レッスン購入時に個人メッセージを作成
  createMessages() {}
}
