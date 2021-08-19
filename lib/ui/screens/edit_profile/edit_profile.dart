import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:subero_mobile/controller/edit_profile/edit_profile_controller.dart';
import 'package:subero_mobile/data/provider/providers.dart';
import 'package:subero_mobile/data/repository/repositorys.dart';

class EditProfile extends StatelessWidget {

  final EditProfileController c = Get.put(EditProfileController(repository: UserRepository(userProvider: UserProvider())));
  EditProfile();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('プロフィールの編集')),
      body: Container(
        child: Column(children: [
          Text("名前"),
          TextField(onChanged:(text)=>c.user.name = text, 
          ),
          Text("自己紹介"),
          TextField(onChanged:(text)=>c.user.introduction = text,),
          Text("スノボ歴"),
          TextField(onChanged:(year)=>c.user.career = int.parse(year),),
          Text("得意な技"),
          TextField(onChanged:(text)=>c.user.favoriteTrick = text,),
          Text("ホームゲレンデ"),
          TextField(onChanged:(text)=>c.user.homeSkiResort = text,),
          ElevatedButton(onPressed: ()=>{c.editProfile()}, child: Text("決定")),
        ],),
      ),
    );
  }
}
