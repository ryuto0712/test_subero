import 'package:get/get.dart';

import 'package:subero_mobile/controller/message/messages_controller.dart';
import 'package:subero_mobile/controller/message/messege_contents_controller.dart';
import 'package:subero_mobile/data/provider/lesson_provider.dart';
import 'package:subero_mobile/data/repository/lesson_repository.dart';

class MessageContentsBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MessageContentsController>(() => MessageContentsController(LessonRepository(lessonProvider: LessonProvider())));
  }
}
