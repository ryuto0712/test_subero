import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:subero_mobile/controller/edit_profile/edit_profile_controller.dart';
import 'package:subero_mobile/data/provider/providers.dart';
import 'package:subero_mobile/data/repository/repositorys.dart';
import 'package:subero_mobile/ui/screens/edit_profile/widget/career_field.dart';
import 'package:subero_mobile/ui/screens/edit_profile/widget/favorite_trick_field.dart';
import 'package:subero_mobile/ui/screens/edit_profile/widget/home_ski_resort_field.dart';
import 'package:subero_mobile/ui/screens/edit_profile/widget/introduction_field.dart';
import 'package:subero_mobile/ui/screens/edit_profile/widget/name_edit_field.dart';

class EditProfile extends StatelessWidget {
  final EditProfileController c = Get.put(EditProfileController(
      repository: UserRepository(userProvider: UserProvider())));
  EditProfile();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('プロフィールの編集')),
      body: SingleChildScrollView(
        child: Container(
          alignment: Alignment.center,
          padding: EdgeInsets.only(top: 20),
          child: Container(
            width: 300,
            child: Column(
              children: [
                NameField(),
                IntroductionField(),
                CareerField(),
                FavoriteTrickField(),
                HomeSkiResortField(),
                Padding(padding: EdgeInsets.only(top: 10)),
                ElevatedButton(
                  onPressed: () => {c.editProfile()},
                  child: Text("決定",
                      style: TextStyle(color: Colors.black45, fontSize: 20)),
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
