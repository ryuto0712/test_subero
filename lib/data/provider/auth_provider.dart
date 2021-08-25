import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:subero_mobile/ui/screens/auth/sign_up.dart';
import '../../main.dart';

class AuthProvider {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final GetStorage box = GetStorage();
  final CollectionReference _users =
      FirebaseFirestore.instance.collection("users");

  Future<String> registerUser(String email, String password) async {
    UserCredential _authResult =
        await _firebaseAuth.createUserWithEmailAndPassword(
            email: email.trim(), password: password.trim());
    final uid = _authResult.user!.uid.toString();
    return uid;
  }

  Future<String> loginFromEmail(String email, String password) async {
    try {
      UserCredential _authResult =
          await _firebaseAuth.signInWithEmailAndPassword(
              email: email.trim(), password: password.trim());
      final uid = _authResult.user!.uid.toString();
      final user = await _users.doc(uid).get();
        box.write("userId", uid);
      box.write("userName", user["name"]);
      box.write("userIcon", user["icon_url"]);
      box.write("userRating", user["rating"]);
      return uid;
    } catch (e) {
      print("login error: $e");
      rethrow;
    }
  }

  loginCheck() async {
    final User? currentUser = _firebaseAuth.currentUser;
    if (currentUser == null) {
      Get.to(SignUp());
    } else {
      try {
        box.write("userId", currentUser.uid);
        final user = await _users.doc(currentUser.uid).get();
        box.write("userName", user["name"]);
        box.write("userIcon", user["icon_url"]);
        box.write("userRating", user["rating"]);
        Get.to(MyApp());
      } catch (e) {
        print("provider error: $e");
        Get.to(SignUp());
        rethrow;
      }
    }
  }
}
  // Future<void> resetPassword(String email) async {
  //   print(email);
  //   try {
  //     print('sending reset');
  //     await _firebaseAuth.sendPasswordResetEmail(email: email);
  //     EasyLoading.showSuccess("Check your email to reset your password");
  //     Get.back();
  //   } catch (error) {
  //     print('get inoto error');
  //     EasyLoading.showError(error.toString());
  //   }
  // }

  // Future<void> signOutUser() async {
  //   await _firebaseAuth.signOut();
  // }

