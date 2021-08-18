import 'package:get/get.dart';

import 'package:subero_mobile/controller/lesson_post/lesson_post_controller.dart';
import 'package:subero_mobile/data/provider/lesson_provider.dart';
import 'package:subero_mobile/data/repository/lesson_repository.dart';

class LessonPostBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LessonPostController>(
      () => LessonPostController(
        repository: LessonRepository(lessonProvider: LessonProvider()),
      ),
    );
  }
}
