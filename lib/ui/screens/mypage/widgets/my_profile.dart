import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:expandable_text/expandable_text.dart';
import 'package:get_storage/get_storage.dart';
import 'package:subero_mobile/controller/controllers.dart';

import 'package:subero_mobile/ui/screens/index.dart';
import 'index.dart';

class MyProfile extends StatelessWidget {
  final UserController c = Get.find<UserController>();
  final GetStorage box =GetStorage();
  @override
  Widget build(BuildContext context) {
  c.getUser(box.read("userId"));
    return Column(
      children: [
        Container(
          width: 300,
          margin: EdgeInsets.only(bottom: 10),
          color: Colors.white,
          child: Obx(() => Column(
                children: [
                  MyPageIcon(c.user.videoUrl, c.user.iconUrl),
                  _userName(c.user.name),
                  _userDescription(c.user.introduction),
                  _userInformation(c.user.career, c.user.favoriteTrick, c.user.homeSkiResort),
                  _profileEditButton(),
                ],
              )),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.only(bottom: 10),
              child: ContractingLessons(),
            ),
            Container(
              padding: EdgeInsets.only(bottom: 10),
              child: PostedLessons(),
            ),
            Container(
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(width: 1, color: Colors.grey.shade400),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _userName(String name) {
    return Container(
      child: Text(name, style: TextStyle(fontSize: 24, color: Color(0xff555555))),
    );
  }

  Widget _userDescription(String introduction) {
    return Container(
      padding: EdgeInsets.only(top: 10),
      // alignment: ,
      width: 300,
      child: ExpandableText(
        introduction,
        expandText: "???????????????",
        collapseText: "?????????",
        maxLines: 3,
        linkColor: Colors.black38,
        style: TextStyle(fontSize: 13),
        textAlign: TextAlign.center,
      ),
    );
  }

  Widget _profileEditButton() {
    return Container(
      child: ButtonTheme(
        height: 100,
        minWidth: 200,
        child: OutlinedButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
          ),
          onPressed: () => Get.to(EditProfile(), id: null),
          child: Text('?????????????????????????????????', style: TextStyle(color: Colors.black45, fontSize: 10)),
        ),
      ),
    );
  }

  Widget _userInformation(int career, String favoriteTrick, String homeSkiResort) {
    return Container(
      margin: EdgeInsets.fromLTRB(0, 10, 0, 10),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text("????????????"), Text("????????????"), Text("?????????????????????")]),
            Padding(
              padding: EdgeInsets.all(30),
            ),
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text(career.toString() + "???"), Text(favoriteTrick), Text(homeSkiResort)])
          ],
        ),
      ),
    );
  }
}
