import 'package:get/get.dart';
import 'package:subero_mobile/data/model/comment_model.dart';
import 'package:subero_mobile/data/model/lesson_model.dart';
import 'package:subero_mobile/data/repository/lesson_repository.dart';

class LessonDetailsController extends GetxController {
  final LessonRepository repository;
  LessonDetailsController({required this.repository});

  // レッスンデータ取得
  final _lesson = LessonModel().obs;
  set lesson(value) => this._lesson.value = value;
  get lesson => this._lesson.value;

  getLesson(String lessonId) async {
    try {
      this._lesson.value = await repository.getLesson(lessonId);
    } catch (e) {
      print('Controller Error: $e');
    }
  }

  // * コメント関連
  // コメントをするボタン
  final doComment = Rx<bool>(false).obs();
  toggleDoComment() => {doComment.value = true}; // コメント入力欄の表示

  CommentModel _commentModel = CommentModel(); // 投稿するコメント情報

  // コメントの追加
  addComment(String userId, String userName, String userIcon, String contents) async {
    try {
      _commentModel.userId = userId;
      _commentModel.userName = userName;
      _commentModel.userIcon = userIcon;
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
