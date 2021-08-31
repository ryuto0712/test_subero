// import 'package:get/get.dart';
// import 'package:get_storage/get_storage.dart';
// import 'package:subero_mobile/data/model/lesson_model.dart';

// import 'package:subero_mobile/data/repository/lesson_repository.dart';

// // TODO: レッスンの写真の複数選択

// class SearchedController extends GetxController {
//   final LessonRepository repository;
//   SearchedController({required this.repository});

//   final _lesson = LessonModel().obs;
//   set lesson(value) => this._lesson.value = value;
//   get lesson => this._lesson.value;

//   postLesson() async {
//     try {
//       _lesson.value.createdAt = DateTime.now();
//       _lesson.value.editedAt = DateTime.now();
//       _lesson.value.hostId = box.read('userId');
//       _lesson.value.hostName = box.read('userName');
//       _lesson.value.hostIcon = box.read('userIcon');
//       _lesson.value.hostRating = box.read('userRating');

//       // 投稿を行い，新しく投稿したレッスンのidを取得
//       _lesson.value.lessonId = await repository.postLesson(_lesson.value);

//       // TODO: 新しく投稿したレッスン情報(lessonId等？)をuserの投稿したレッスンに追加

//     } catch (e) {
//       print('Controller Error: $e');
//     }
//   }
// }

