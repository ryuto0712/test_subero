import 'package:get/get.dart';

import 'package:subero_mobile/controller/message/messages_controller.dart';
import 'package:subero_mobile/data/provider/messages_provider.dart';
import 'package:subero_mobile/data/repository/messages_repository.dart';

class MessagesBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MessagesController>(() => MessagesController(MessagesRepository(messagesProvider: MessagesProvider())));
  }
}
