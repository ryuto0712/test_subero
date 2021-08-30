import 'package:get/get.dart';
import 'package:subero_mobile/data/model/lesson_model.dart';
import 'package:subero_mobile/data/repository/lesson_repository.dart';

class SearchedLessonsController extends GetxController {
  final LessonRepository repository;
  SearchedLessonsController(this.repository);

  final _lessons = RxList<LessonModel>().obs;
  set lessons(value) => this._lessons.value = value;
  get lessons => this._lessons.value;

  searchLessons() async {
    // 検索クエリを何かしらで入力，とりあえず適当に作成順にレッスン情報を取得
    List<List> queries = [
      ['orderBy', 'created_at', true],
    ];
    try {
      this._lessons.value = RxList(await repository.searchLessons(queries));
    } catch (e) {
      print('SearchedLessonsController Error: $e');
    }
  }
}
