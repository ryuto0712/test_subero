import 'package:get/get.dart';

class CommentWidgetController extends GetxController {
  final _doComment = false.obs;
  set doComment(value) => this._doComment.value = value;
  get doComment => this._doComment.value;
  toggleDoComment() => this._doComment.value = !this._doComment.value;
}
