import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'controller/tab/tab_controller.dart';
import 'routes/app_pages.dart';
// import 'package:subero_mobile/bindings/my_bindings.dart';
import 'ui/screens/index.dart';
import 'ui/theme/app_theme.dart';

// todo: 現在のルートのアイコンを押したらルートの初期ページに直接移動できない

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  // FirebaseFirestore firestore = FirebaseFirestore.instance;
  // debugPaintSizeEnabled = true; // widgetのレンダリングチェック
  runApp(GetMaterialApp(
    debugShowCheckedModeBanner: false, // Remoce the debug banner
    // initialRoute: Routes.INITIAL,
    // initialBinding: HomeBinding(),
    theme: appThemeData,
    defaultTransition: Transition.fade,
    // getPages: AppPages.pages,
    home: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  // _pageWidgetsを引数に入れたかったけど入れられなかった．
  final MyTabController tabController = Get.put(MyTabController([Home(), Search(), if (isHost) Post(), Message(), MyPage()]));

  static const isHost = true; // 登録したライダーかどうか

  // 表示するタブ
  final _pageWidgets = [
    HomeNavigator(),
    SearchNavigator(),
    if (isHost) PostNavigator(),
    MessageNavigator(),
    MyPageNavigator(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: buildBottomNavigationMenu(tabController),
      body: Obx(
        () => IndexedStack(
          index: tabController.tabIndex.value,
          children: _pageWidgets,
        ),
      ),
    );
  }

  //  タブバーの設定
  buildBottomNavigationMenu(tabController) {
    return Obx(
      () => BottomNavigationBar(
        // showSelectedLabels: false,
        // showUnselectedLabels: false,
        selectedFontSize: 10,
        unselectedFontSize: 10,
        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.black.withOpacity(0.1),
        // fixedColor: Colors.greenAccent,
        // backgroundColor: ,

        currentIndex: tabController.tabIndex.value,
        onTap: tabController.changeTabIndex,
        type: BottomNavigationBarType.fixed, // ボタン押した時の動き．fixedなら完全固定
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'ホーム'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: '検索'),
          if (isHost) BottomNavigationBarItem(icon: Icon(Icons.add_box), label: '投稿'),
          BottomNavigationBarItem(icon: Icon(Icons.message_outlined), label: 'メッセージ'),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'マイページ'),
        ],
      ),
    );
  }
}
