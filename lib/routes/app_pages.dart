import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:subero_mobile/bindings/lesson_details_binding.dart';
import 'package:subero_mobile/ui/screens/mypage/mypage.dart';
import 'package:subero_mobile/ui/screens/index.dart';
import '../bindings/bidings.dart';
import './app_routes.dart';

//bindingの値を設定しておくことで、そのページで使うコントローラーをあらかじめ初期化できる(get.findのみで呼び出せる)。
//名前付きルーティングでの移動しないとコントローラーの初期化が行われない。
class AppPages {
  static final routes = [
    // GetPage(name: Routes.HOME, page: () => Home(), binding: HomeBinding()),
    GetPage(name: Routes.MYPAGE, page: () => MyPage(), binding: MyPageBinding()),
    GetPage(name: Routes.MESSAGE, page: () => Message(), binding: MyPageBinding()),
    GetPage(name: Routes.POST, page: () => Post(), binding: MyPageBinding()),
    GetPage(name: Routes.SEARCH, page: () => Search(), binding: MyPageBinding()),
    GetPage(name: Routes.ACCOUNT_CONFIG, page: () => AccountConfig(), binding: MyPageBinding()),
    GetPage(name: Routes.BEFORE_PURCHASE, page: () => BeforePurchase(), binding: MyPageBinding()),
    GetPage(name: Routes.EDIT_PROFILE, page: () => EditProfile(), binding: MyPageBinding()),
    GetPage(name: Routes.GUIDE, page: () => Guide(), binding: GuidePageBinding()),
    GetPage(name: Routes.IINE_LIST, page: () => IineList(), binding: MyPageBinding()),
    GetPage(name: Routes.INDIVIDUAL_MESSAGE, page: () => IndividualMessage(), binding: MyPageBinding()),
    GetPage(name: Routes.LESSON_DETAILS, page: () => LessonDetails(), binding: LessonDetailsBinding()),
    GetPage(name: Routes.NOTIFICATION_CONFIG, page: () => NotificationConfig(), binding: MyPageBinding()),
    GetPage(name: Routes.POST_EVENT, page: () => PostEvent(), binding: MyPageBinding()),
    GetPage(name: Routes.POST_PERMANENT_LESSON, page: () => PostPermanentLesson(), binding: MyPageBinding()),
    GetPage(name: Routes.QUESTION_AND_ANSWER, page: () => QuestionAndAnswer(), binding: MyPageBinding()),
    GetPage(name: Routes.SEARCHED, page: () => Searched(), binding: MyPageBinding()),
    GetPage(name: Routes.USER_PAGE, page: () => UserPage(), binding: MyPageBinding()),
    GetPage(name: Routes.VIDEO, page: () => Video("a"), binding: MyPageBinding()),
  ];
}

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
