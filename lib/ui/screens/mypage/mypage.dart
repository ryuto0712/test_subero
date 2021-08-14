import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:subero_mobile/data/provider/user_provider.dart';
import 'package:subero_mobile/data/repository/test_repository.dart';
import '../../../controller/my_page/user_controller.dart';
import "../../../controller/controllers.dart";

class MyPage extends GetView<UserController> {
  @override
  Widget build(BuildContext context) {
    final UserController c = Get.find<UserController>();
    return Scaffold(
      body: Container(
          child: Column(
        children: [
          Obx(() => Text(c.user.name)),
          FloatingActionButton(
              child: Text("push"), onPressed: () => c.getUser("1"))
        ],
      )

          // child: GetBuilder<UserController>(
          //     initState: (_) async{ await Get.find(UserController(repository:UserRepository(userProvider: UserProvider()))).getUser("1") ;},
          //     builder: (controller) {
          //       print('start builder in mypage');
          //       print(controller.user);
          //       return
          //       ListView.builder(
          //         itemBuilder: (context, index) {
          //           return ListTile(
          //             title: Text(controller.user["name"] ?? 'a'),
          //             subtitle: Text(controller.user["introduction"] ?? 'b'),
          //           );
          //         },
          //         // itemCount: _.user.length,
          //       );
          //     }),

          ),
    );
  }
}

// class MyPage extends StatelessWidget {
//   String userName = 'TOICHI SHOGO';
//   String description = 'はじめまして！gnuのライダーをしている十市です！スノボ歴は5年で得意なジャンルは地理です！';
//   Map<String, String> profileMap = {
//     'スノボ歴': '5年',
//     'スポンサー': 'Gnu, わか大将',
//     '得意な技': 'CAB1440',
//     'ホームゲレンデ': '神立スキー場',
//   };
//   String video = 'images/icon_sample.png';

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('マイページ')),
//       body: SingleChildScrollView(
//         child: Column(
//           children: <Widget>[
//             // #todo: 隠れちゃう
//             MyProfile(userName, description + '\n' + description, video),
//             BottomList(),
//             Image.asset('images/mypage.png'),
//           ],
//         ),
//       ),
//     );
//   }
// }
