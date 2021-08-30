import 'package:get/get.dart';
import 'package:subero_mobile/data/model/lesson_model.dart';
import 'package:subero_mobile/data/repository/lesson_repository.dart';

// TODO: 新しく投稿されたレッスンの取得

class NewLessonsController extends GetxController {
  final LessonRepository repository;
  NewLessonsController(this.repository);

  final _lessons = RxList<LessonModel>().obs;
  set lessons(value) => this._lessons.value = value;
  get lessons => this._lessons.value;

  getNewLessons() async {
    List<List> queries = [
      ['orderBy', 'created_at', true],
    ];
    try {
      this._lessons.value = RxList(await repository.searchLessons(queries));
    } catch (e) {
      print('NewLessonsController Error: $e');
    }
  }
}
