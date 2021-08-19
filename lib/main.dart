import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:firebase_core/firebase_core.dart';

// import 'package:flutter/rendering.dart'; // レンダリング確認

import 'controller/tab/tab_controller.dart';
import './routes/routes.dart';
// import 'package:subero_mobile/bindings/my_bindings.dart';
import 'ui/screens/index.dart';
import 'ui/theme/app_theme.dart';
import './bindings/bidings.dart';

// todo: 現在のルートのアイコンを押したらルートの初期ページに直接移動できない

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(); // * firebaseの初期化
  await GetStorage.init(); // * get storageの初期化.
  // debugPaintSizeEnabled = true; // widgetのレンダリングチェック
  runApp(GetMaterialApp(
    // initialBinding: ;
    // debugShowCheckedModeBanner: true, // falseにすると右上のdebagのバナーが消える(が警告が出てくる)
    // initialRoute: Routes.INITIAL,
    // initialBinding: HomeBinding(),
    theme: appThemeData,
    defaultTransition: Transition.fade,
    getPages: AppPages.routes,
    home: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  final GetStorage box = GetStorage();
  // _pageWidgetsを引数に入れたかったけど入れられなかった．
  final MyTabController tabController = Get.put(MyTabController([Home(), Search(), Post(), Message(), MyPage()]));

  // 表示するタブ
  final _pageWidgets = [
    HomeNavigator(),
    SearchNavigator(),
    PostNavigator(),
    MessageNavigator(),
    MyPageNavigator(),
  ];

  @override
  Widget build(BuildContext context) {
    // TODO: ログイン時にgetStrageに主なユーザーデータを保存
    box.write('userId', 'sample_1');
    box.write('userName', 'Kambayashi Izuru');
    box.write('userIcon', 'images/icon_sample.png');
    box.write('userRating', 4.0);

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
        unselectedItemColor: Colors.black.withOpacity(0.4),
        // fixedColor: Colors.greenAccent,
        // backgroundColor: ,

        currentIndex: tabController.tabIndex.value,
        onTap: tabController.changeTabIndex,
        type: BottomNavigationBarType.fixed, // ボタン押した時の動き．fixedなら完全固定
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'ホーム'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: '検索'),
          BottomNavigationBarItem(icon: Icon(Icons.add_box), label: '投稿'),
          BottomNavigationBarItem(icon: Icon(Icons.message_outlined), label: 'メッセージ'),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'マイページ'),
        ],
      ),
    );
  }
}
