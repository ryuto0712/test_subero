import 'package:subero_mobile/data/model/comment_model.dart';
import 'package:subero_mobile/data/provider/lesson_provider.dart';

class LessonRepository {
  final LessonProvider lessonProvider;

  LessonRepository({required this.lessonProvider});
  getLesson(String lessonId) {
    return lessonProvider.getLesson(lessonId);
  }

  addComment(String lessonId, CommentModel commentModel) {
    print('repositoryなう');
    print(
      [commentModel.userId, commentModel.userName, commentModel.contents, commentModel.createdAt],
    );
    return lessonProvider.addComment(lessonId, commentModel);
  }
}
