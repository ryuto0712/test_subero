import 'package:get/get.dart';

// TODO: 押されたタブのルートページにいるときは同じタブをクリックしても反応しないようにしたい．
class MyTabController extends GetxController {
  final List _widgetList;
  MyTabController(this._widgetList);

  final tabIndex = 0.obs;

  void changeTabIndex(int index) {
    if (index != tabIndex.value)
      tabIndex.value = index;
    else
      Get.offAll(_widgetList[index], id: index);
  }

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void dispose() {
    super.dispose();
  }
}
