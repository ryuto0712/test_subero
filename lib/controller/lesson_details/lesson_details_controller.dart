import 'package:get/get.dart';
import 'package:subero_mobile/data/model/lesson_model.dart';
import 'package:subero_mobile/data/repository/lesson_repository.dart';

class LessonDetailsController extends GetxController {
  final LessonRepository repository;
  LessonDetailsController({required this.repository});

  final _lesson = LessonModel().obs;
  set lesson(value) => this._lesson.value = value;
  get lesson => this._lesson.value;

  getLesson(String lessonId) async {
    try {
      _lesson.value = await repository.getLesson(lessonId);
    } catch (e) {
      print('Controller Error: $e');
    }
  }
}
