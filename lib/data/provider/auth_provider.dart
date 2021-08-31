import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:subero_mobile/ui/screens/auth/sign_in.dart';
import '../../main.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthProvider {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final GetStorage box = GetStorage();
  final CollectionReference _users = FirebaseFirestore.instance.collection("users");

  Future<String> registerUser(String email, String password) async {
    UserCredential _authResult = await _firebaseAuth.createUserWithEmailAndPassword(email: email.trim(), password: password.trim());
    final uid = _authResult.user!.uid.toString();
    return uid;
  }

  Future<bool> signInWithEmail(String email, String password) async {
    try {
      // ユーザー情報の取得
      UserCredential _authResult = await _firebaseAuth.signInWithEmailAndPassword(
        email: email.trim(),
        password: password.trim(),
      );
      final uid = _authResult.user!.uid.toString();
      final user = await _users.doc(uid).get();

      // ユーザー情報をgetStrageに保存
      box.write("userId", uid);
      box.write("userName", user["name"]);
      box.write("userIcon", user["icon_url"]);
      box.write("userRating", user["rating"]);
      // Get.to(MyApp());

      return true;
    } catch (e) {
      print("login error: $e");
      rethrow;
    }
  }

  loginCheck() async {
    final User? currentUser = _firebaseAuth.currentUser;
    if (currentUser == null) {
      Get.to(SignIn());
    } else {
      try {
        print(currentUser.uid);
        final user = await _users.doc(currentUser.uid).get();

        // ユーザー情報をgetStrageに保存
        box.write("userId", currentUser.uid);
        box.write("userName", user["name"]);
        box.write("userIcon", user["icon_url"]);
        box.write("userRating", user["rating"]);

        Get.to(MyApp());
      } catch (e) {
        print("provider error: $e");
        Get.to(SignIn());
        rethrow;
      }
    }
  }

  Future<bool?> signInWithGoogle() async {
    final GoogleSignIn _googleSignIn = GoogleSignIn();
    final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();

    final GoogleSignInAuthentication googleAuth = await googleUser!.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    UserCredential userCredential = await FirebaseAuth.instance.signInWithCredential(credential);
    final String? userName = userCredential.user?.displayName.toString();
    final String? uid = userCredential.user?.uid.toString();

    if (uid != null) {
      try {
        final user = await _users.doc(uid).get();
        // ユーザー情報をgetStrageに保存
        box.write("userId", uid);
        box.write("userName", user["name"]);
        box.write("userIcon", user["icon_url"]);
        box.write("userRating", user["rating"]);
        Get.to(MyApp());
        return true;
      } catch (e) {
        // ユーザー情報が取得できなかった場合
        try {
          // ユーザーの作成を行う
          await _users.doc(uid).set({
            "name": userName,
            "introduction": "",
            "account_type": "normal",
            "career": 1,
            "favorite_trick": "",
            "sponser": "",
            "license": "",
            "home_ski_resort": "",
            "created_at": DateTime.now(),
            "edited_at": DateTime.now(),
            "icon_url": "https://firebasestorage.googleapis.com/v0/b/subero-app.appspot.com/o/user_icon%2F308866.png?alt=media&token=dfc47611-1203-4953-be36-7c6bf9806cb3",
            "video_url": "https://firebasestorage.googleapis.com/v0/b/subero-app.appspot.com/o/user_video%2F1-image_picker6901468253184652419.mp4?alt=media&token=bf5f99e4-fc00-487c-83b4-5169d6d836fc",
            "rating": 0,
          });
          // ユーザー情報をgetStrageに保存
          box.write("userId", uid);
          box.write("userName", userName);
          box.write("userIcon", "https://firebasestorage.googleapis.com/v0/b/subero-app.appspot.com/o/user_icon%2F308866.png?alt=media&token=dfc47611-1203-4953-be36-7c6bf9806cb3");
          box.write("userRating",
              "https://firebasestorage.googleapis.com/v0/b/subero-app.appspot.com/o/user_video%2F1-image_picker6901468253184652419.mp4?alt=media&token=bf5f99e4-fc00-487c-83b4-5169d6d836fc");
          Get.to(MyApp());
          return true;
        } catch (e) {
          print("provider error: $e");
          rethrow;
        }
      }
    }
  }

  Future<void> signOutUser() async {
    await _firebaseAuth.signOut();
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
