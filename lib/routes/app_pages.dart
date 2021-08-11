import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:subero_mobile/ui/screens/mypage/mypage.dart';
import 'package:subero_mobile/ui/screens/index.dart';
import 'package:subero_mobile/bindings/details_binding.dart';
part './app_routes.dart';

// class AppPages {
//   static final routes = [
//     GetPage(name: Routes.INITIAL, page: () => Home()),
//     GetPage(name: Routes.DETAILS, page: () => MyPage(), binding: DetailsBinding()), //適当
//   ];
// }

class HomeNavigator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: Get.nestedKey(0),
      onGenerateRoute: (settings) {
        return MaterialPageRoute(
          settings: settings,
          builder: (context) {
            return Home();
          },
        );
      },
    );
  }
}

class SearchNavigator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: Get.nestedKey(1),
      onGenerateRoute: (settings) {
        return MaterialPageRoute(
          settings: settings,
          builder: (context) {
            return Search();
          },
        );
      },
    );
  }
}

class PostNavigator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: Get.nestedKey(2),
      onGenerateRoute: (settings) {
        return MaterialPageRoute(
          settings: settings,
          builder: (context) {
            return Post();
          },
        );
      },
    );
  }
}

class MessageNavigator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: Get.nestedKey(3),
      onGenerateRoute: (settings) {
        return MaterialPageRoute(
          settings: settings,
          builder: (context) {
            return Message();
          },
        );
      },
    );
  }
}

class MyPageNavigator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: Get.nestedKey(4),
      onGenerateRoute: (settings) {
        return MaterialPageRoute(
          settings: settings,
          builder: (context) {
            return MyPage();
          },
        );
      },
    );
  }
}
