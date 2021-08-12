import 'package:get/get.dart';

class LikeButtonController extends GetxController {
  final isLiked = false.obs;

  void toggle() {
    isLiked.value = !isLiked.value;
  }
}
