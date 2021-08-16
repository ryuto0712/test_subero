import 'package:subero_mobile/data/provider/lesson_provider.dart';

class LessonRepository {
  final LessonProvider lessonProvider;

  LessonRepository({required this.lessonProvider});
  getLesson(String lessonId) {
    return lessonProvider.getLesson(lessonId);
  }
}
