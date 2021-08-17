import 'package:get/get.dart';

import 'package:subero_mobile/controller/lesson_details/lesson_details_controller.dart';
import 'package:subero_mobile/data/provider/lesson_provider.dart';
import 'package:subero_mobile/data/repository/lesson_repository.dart';

class LessonDetailsBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LessonDetailsController>(
      () => LessonDetailsController(
        repository: LessonRepository(lessonProvider: LessonProvider()),
      ),
    );
  }
}
