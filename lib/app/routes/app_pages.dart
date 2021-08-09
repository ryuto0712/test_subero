import 'package:get/get.dart';
import 'package:subero_mobile/app/ui/screens/mypage/mypage.dart';
import 'package:subero_mobile/app/ui/screens/home/home.dart';
import 'package:subero_mobile/app/bindings/details_binding.dart';
part './app_routes.dart';

class AppPages {
  static final routes = [
    GetPage(
      name: Routes.INITIAL,
      page: () => Home(),
    ),
    GetPage(name: Routes.DETAILS, page: () => Mypage(), binding: DetailsBinding()), //適当
  ];
}
