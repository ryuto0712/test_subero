import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'package:subero_mobile/data/model/lesson_model.dart';
import 'package:subero_mobile/data/repository/lesson_repository.dart';

class PostedLessonCardController extends GetxController {
  final LessonRepository repository;
  PostedLessonCardController(this.repository);
  final GetStorage box = GetStorage();

  final _lessons = RxList<LessonModel>().obs;
  get lessons => this._lessons.value;

  getLessons() async {
    if (this._lessons.value.length == 0) {
      try {
        List<List> queries = [
          ['where', 'host_id', '==', box.read('userId')],
          ['orderBy', 'created_at', false],
        ];
        this._lessons.value = RxList(await repository.searchLessons(queries));
      } catch (e) {
        print('投稿されたレッスン情報を取得できませんでした．$e');
      }
    }
  }
}
