import 'package:subero_mobile/controller/home/home_controller.dart';
import 'package:subero_mobile/data/provider/api.dart';
import 'package:subero_mobile/data/repository/posts_repository.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(() {
      return HomeController(repository: MyRepository(apiClient: MyApiClient(httpClient: http.Client())));
    });
  }
}
