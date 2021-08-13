import 'package:cloud_firestore/cloud_firestore.dart';
import '../model/user_model.dart';
import "../model/models.dart";

class UserProvider {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  // Future<bool> createNewUser(UserData user) async {
  //   try {
  //     await firestore.collection("users").doc(user.name).set({
  //       "name": user.name,
  //       "introduction": user.introduction,
  //     });
  //     return true;
  //   } catch (e) {
  //     print(e);
  //     return false;
  //   }
  // }

  Future<UserData> getUser(String uid) async {
    try {
      print("プロバイダでgetUserが走りました。");
      DocumentSnapshot _doc =
          await firestore.collection("users").doc(uid).get();
      print("プロバイダで値の取得が完了しました。" + _doc["name"]);
      var u = new UserData.fromDocumentSnapshot(documentSnapshot: _doc);
      print("プロバイダでモデルに値が入りました。" + u.name);
      return u;
    } catch (e) {
      print(e);
      print("provider error");
      rethrow;
    }
  }
}
