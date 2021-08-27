import 'package:get/get.dart';

import 'package:subero_mobile/controller/lesson_post/lesson_post_controller.dart';
import 'package:subero_mobile/data/provider/lesson_provider.dart';
import 'package:subero_mobile/data/provider/providers.dart';
import 'package:subero_mobile/data/repository/lesson_repository.dart';
import 'package:subero_mobile/data/repository/repositorys.dart';

class LessonPostBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LessonPostController>(
      () => LessonPostController(
        lessonRepository: LessonRepository(lessonProvider: LessonProvider()),
        userRepository: UserRepository(userProvider: UserProvider()),
      ),
    );
  }
}
