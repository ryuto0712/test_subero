import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:subero_mobile/data/model/comment_model.dart';
import 'package:subero_mobile/data/model/lesson_model.dart';
import 'package:subero_mobile/data/repository/lesson_repository.dart';

class LessonDetailsController extends GetxController {
  final LessonRepository repository;
  LessonDetailsController({required this.repository});

  final GetStorage box = GetStorage();

  // レッスンデータ取得
  final _lesson = LessonModel().obs;
  set lesson(value) => this._lesson.value = value;
  get lesson => this._lesson.value;

  // * レッスンデータ取得
  getLesson(String lessonId) async {
    try {
      this._lesson.value = await repository.getLesson(lessonId);
    } catch (e) {
      print('Controller Error: $e');
    }
  }

  // * コメント関連
  CommentModel _commentModel = CommentModel(); // 投稿するコメント情報

  // コメントの追加
  addComment(String contents) async {
    try {
      _commentModel.userId = box.read('userId');
      _commentModel.userName = box.read('userName');
      _commentModel.userIcon = box.read('userIcon');
      _commentModel.contents = contents;
      _commentModel.createdAt = DateTime.now();

      // await _setCommentModel(userId, userName, userIcon, contents);
      await repository.addComment(_lesson.value.lessonId, _commentModel);

      // 表示内容を更新するため再度レッスンデータを取得
      this.getLesson(this._lesson.value.lessonId);
    } catch (e) {
      print('コメント送信に失敗しました: $e');
    }
  }
}
