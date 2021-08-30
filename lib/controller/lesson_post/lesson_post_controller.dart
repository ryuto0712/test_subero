import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:subero_mobile/data/model/lesson_model.dart';

import 'package:subero_mobile/data/repository/lesson_repository.dart';
import 'package:subero_mobile/data/repository/repositorys.dart';
// import 'package:subero_mobile/routes/routes.dart';

// TODO: レッスンの写真の投稿

class LessonPostController extends GetxController {
  final GetStorage box = GetStorage();
  final LessonRepository lessonRepository;
  final UserRepository userRepository;
  LessonPostController({required this.lessonRepository, required this.userRepository});

  final _lesson = LessonModel().obs;
  set lesson(value) => this._lesson.value = value;
  get lesson => this._lesson.value;

  postLesson() async {
    try {
      // 投稿時間の設定
      _lesson.value.createdAt = DateTime.now();
      _lesson.value.editedAt = DateTime.now();

      // getStrageからユーザーのid, 名前，アイコン，評価を取得
      _lesson.value.hostId = box.read('userId');
      _lesson.value.hostName = box.read('userName');
      _lesson.value.hostIcon = box.read('userIcon');
      _lesson.value.hostRating = box.read('userRating');

      // 投稿を行い，新しく投稿したレッスンのidを取得
      _lesson.value.lessonId = await lessonRepository.postLesson(_lesson.value);

      userRepository.addPostedLessons(_lesson.value.lessonId);
      // Get.toNamed(Routes.LESSON_DETAILS, parameters: {'lessonId': _lesson.value.lessonId});
    } catch (e) {
      print('Controller Error: $e');
    }
  }
}
