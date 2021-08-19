// TODO: スノボ歴～～の表示
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:subero_mobile/ui/screens/index.dart';
import 'package:subero_mobile/ui/widgets/index.dart';
import 'index.dart';

class MyProfile extends StatefulWidget {
  String userName;
  String description;
  // Map<String, String> ProfileMap;
  String video;
  String playedYear;
  String favoTrick;
  String homeGerende;
  MyProfile(this.userName, this.description, this.video, this.playedYear,
      this.favoTrick, this.homeGerende);
  @override
  _MyProfileState createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 300,
          margin: EdgeInsets.only(bottom: 10),
          color: Colors.white,
          child: Column(
            children: [
              MyPageIcon(widget.video),
              _userName(widget.userName),
              _userDescription(widget.description),
              _profileEditButton(),
              _userInformation(
                  widget.playedYear, widget.favoTrick, widget.homeGerende)
            ],
          ),
        ),
        Container(
          padding: EdgeInsets.only(bottom: 10),
          child: ContractingLessons(),
        ),
        Container(
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(width: 1, color: Colors.grey.shade400),
            ),
          ),
        ),
      ],
    );
  }

  Widget _userName(String userName) {
    return Container(
      child: Text(userName,
          style: TextStyle(fontSize: 24, color: Color(0xff555555))),
    );
  }

  Widget _userDescription(String description) {
    return Container(
      padding: EdgeInsets.only(top: 10),
      // alignment: ,
      width: 300,
      child: Text(
        description,
        style: TextStyle(fontSize: 12),
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
          child: Text('プロフィールを編集する',
              style: TextStyle(color: Colors.black45, fontSize: 10)),
        ),
      ),
    );
  }

  Widget _userInformation(
      String playedYear, String favoTrick, String homeGerende) {
    return Container(
      margin: EdgeInsets.fromLTRB(0, 10, 0, 10),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [Text("スノボ歴"), Text("得意な技"), Text("ホームゲレンデ")]),
            Padding(
              padding: EdgeInsets.all(30),
            ),
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(playedYear),
              Text(favoTrick),
              Text(homeGerende)
            ])
          ],
        ),
      ),
    );
  }
}
