import 'package:subero_mobile/data/model/comment_model.dart';
import 'package:subero_mobile/data/model/lesson_model.dart';
import 'package:subero_mobile/data/provider/lesson_provider.dart';

class LessonRepository {
  final LessonProvider lessonProvider;

  LessonRepository({required this.lessonProvider});

  // レッスン情報の取得
  getLesson(String lessonId) {
    return lessonProvider.getLesson(lessonId);
  }

  searchLesson(String key , String value){
    return lessonProvider.searchLesson(key, value);
  }

  // レッスンの投稿
  Future<String> postLesson(LessonModel lessonModel) {
    // 投稿したレッスンのidをコントローラに返す
    return lessonProvider.postLesson(lessonModel);
  }

  // コメントの投稿
  addComment(String lessonId, CommentModel commentModel) {
    return lessonProvider.addComment(lessonId, commentModel);
  }
}
