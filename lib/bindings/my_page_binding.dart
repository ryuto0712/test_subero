import 'package:get/get.dart';
import '../controller/my_page/user_controller.dart';
import '../controller/controllers.dart';
import '../data/repository/test_repository.dart';
import "../data/repository/repositorys.dart";
import '../data/provider/user_provider.dart';
import "../data/provider/providers.dart";

class MyPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UserController>(
      () {
        print("バインディングが走りました。");
        return UserController(
            repository: UserRepository(userProvider: UserProvider()));
      },
    );
  }
}
