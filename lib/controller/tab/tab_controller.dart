import 'package:get/get.dart';

class MyTabController extends GetxController {
// final MyRepository repository;
  final List _widgetList;
  MyTabController(this._widgetList);

  final tabIndex = 0.obs;
  // set obj(value) => this.tabIndex.value = value;
  // get obj => this.tabIndex.value;

  void changeTabIndex(int index) {
    print('pressed index: $index, previousIdex: ${tabIndex.value}');
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
