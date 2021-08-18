import 'package:subero_mobile/data/model/messages_model.dart';
import 'package:subero_mobile/data/provider/messages_provider.dart';

class MessagesRepository {
  final MessagesProvider messagesProvider;

  MessagesRepository({required this.messagesProvider});

  // メッセージの取得
  getMessages(String messageId) {
    return messagesProvider.getMessages(messageId);
  }

  addMessage(String messageId, MessageModel messageModel) {
    return messagesProvider.addMessage(messageId, messageModel);
  }
}
