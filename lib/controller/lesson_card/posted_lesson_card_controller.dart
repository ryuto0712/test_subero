import 'package:get/get.dart';

import 'package:subero_mobile/data/model/lesson_model.dart';
import 'package:subero_mobile/data/repository/lesson_repository.dart';

class PostedLessonCardController extends GetxController {
  final LessonRepository repository;
  PostedLessonCardController(this.repository);

  final _lessons = RxList<LessonModel>().obs;
  // set lessons(value) => this._lessons.value = value;
  get lessons => this._lessons.value;

  getLessons(List<String> lessonIds) async {
    if (this._lessons.value.length == 0) {
      try {
        this._lessons.value = RxList([for (int i = 0; i < lessonIds.length; i++) LessonModel()]);
        for (int i = 0; i < lessonIds.length; i++) {
          this._lessons.value[i] = await repository.getLesson(lessonIds[i]);
        }
      } catch (e) {
        print('postedレッスン情報を取得できませんでした．$e');
      }
    }
  }
}
