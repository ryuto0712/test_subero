import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:subero_mobile/data/model/lesson_model.dart';
import 'package:subero_mobile/data/repository/lesson_repository.dart';

class MessageContentsController extends GetxController {
  final GetStorage box = GetStorage();
  final LessonRepository repository;
  MessageContentsController(this.repository);

  // 進行中の/終了したレッスンの取得
  final _onGoingLessons = RxList<LessonModel>().obs;
  get onGoingLessons => this._onGoingLessons.value;
  final _finishedLessons = RxList<LessonModel>().obs;
  get finishedLessons => this._finishedLessons.value;

  getOnGoingLessons() async {
    try {
      List<List> queries = [
        ['where', 'host_id', '==', box.read('userId')],
        // ['where', 'date', '>=', ''] // 今日よりも後に実施日が来るレッスンの取得
      ];
      this._onGoingLessons.value = RxList(await repository.searchLessons(queries));
    } catch (e) {
      print('MessageContentsController Error: $e');
    }
  }

  getFinishedLessons() async {
    try {
      List<List> queries = [
        ['where', 'hostId', '==', box.read('userId')],
        // ['where', 'date', '>=', ''] // 今日よりも前に実施日が来るレッスンの取得
      ];
      this._onGoingLessons.value = RxList(await repository.searchLessons(queries));
    } catch (e) {
      print('MessageContentsController Error: $e');
    }
  }

  final isOngoing = true.obs;
  void toOngoing() => isOngoing.value = true;
  void toDone() => isOngoing.value = false;
}
