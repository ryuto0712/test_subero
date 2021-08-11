import 'package:get/get.dart';

class MessageContentsController extends GetxController {
  final isOngoing = true.obs;
  void toOngoing() {
    isOngoing.value = true;
  }

  void toDone() {
    isOngoing.value = false;
  }
}
