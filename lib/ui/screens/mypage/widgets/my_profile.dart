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
  MyProfile(this.userName, this.description, this.video);
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
          child: Column(
            children: [
              MyPageIcon(widget.video),
              _userName(widget.userName),
              _userDescription(widget.description),
              _profileEditButton(),
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
      child: Text(userName),
    );
  }

  Widget _userDescription(String description) {
    return Container(
      width: 300, child: ExpandableText(description),
      // #todo: スノボ歴～～の表示
    );
  }

  Widget _profileEditButton() {
    return Container(
      child: ElevatedButton(
        onPressed: () => Get.to(EditProfile(), id: null),
        child: Text('プロフィールを編集する'),
      ),
    );
  }
}
