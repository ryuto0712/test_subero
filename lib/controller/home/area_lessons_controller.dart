import 'package:get/get.dart';
import 'package:subero_mobile/data/model/lesson_model.dart';
import 'package:subero_mobile/data/repository/lesson_repository.dart';

class AreaLessonsController extends GetxController {
  final LessonRepository repository;
  AreaLessonsController(this.repository);

  final _lessons = RxList<LessonModel>().obs;
  set lessons(value) => this._lessons.value = value;
  get lessons => this._lessons.value;

  getAreaLessons(String area) async {
    // とりあえずエリアじゃなくてスキー場
    List<List> queries = [
      ['where', 'ski_resort', '==', area]
    ];

    try {
      this._lessons.value = RxList(await repository.searchLessons(queries));
    } catch (e) {
      print('AreaLessonsController Error: $e');
    }
  }
}
