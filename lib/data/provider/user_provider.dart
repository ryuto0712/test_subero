import 'package:cloud_firestore/cloud_firestore.dart';
import '../model/user_model.dart';
import "../model/models.dart";
import 'package:firebase_storage/firebase_storage.dart';
import 'dart:io';

class UserProvider {
  final CollectionReference users =
      FirebaseFirestore.instance.collection("users");

//ユーザの取得
  Future<UserModel> getUser(String uid) async {
    try {
      DocumentSnapshot _doc = await users.doc(uid).get();
      var u = new UserModel.fromDocumentSnapshot(documentSnapshot: _doc);
      return u;
    } catch (e) {
      print("Provider Error: $e");
      rethrow;
    }
  }

//ユーザ作成
  Future<bool> createNewUser(String email, String name) async {
    try {
      await users.doc(email).set({
        "name": name,
      });
      return true;
    } catch (e) {
      print('Privider Error: $e');
      rethrow;
    }
  }

//ユーザ情報の編集
  Future<bool> editProfile(UserModel userModel, String uid) async {
    try {
      await users.doc(uid).set({
        "name": userModel.name,
        "introduction": userModel.introduction,
        "account_type": userModel.accountType,
        "career": userModel.career,
        "favorite_trick": userModel.favoriteTrick,
        "sponser": userModel.sponser,
        "license": userModel.license,
        "home_ski_resort": userModel.homeSkiResort,
        "created_at": userModel.createdAt,
        "edited_at": userModel.editedAt,
        "icon_url": userModel.iconUrl,
        "video_url": userModel.videoUrl,
      });
      return true;
    } catch (e) {
      print('Provider Error: $e');
      rethrow;
    }
  }

  Future<String> uploadImage(File file, String uid, String fileName) async {
    FirebaseStorage storage = FirebaseStorage.instance;
    UploadTask task =
        storage.ref("user_icon").child('$uid-$fileName').putFile(file);
    try {
      TaskSnapshot snapshot = await task;
      final url = await snapshot.ref.getDownloadURL();
      return url;
    } catch (e) {
      print(task.snapshot);
      print("provider error :$e");
      rethrow;
    }
  }

  Future<String> uploadVideo(File file, String uid, String fileName) async {
    FirebaseStorage storage = FirebaseStorage.instance;
    UploadTask task =
        storage.ref("user_video").child('$uid-$fileName').putFile(file);
    try {
      TaskSnapshot snapshot = await task;
      final url = await snapshot.ref.getDownloadURL();
      return url;
    } catch (e) {
      print(task.snapshot);
      print("provider error :$e");
      rethrow;
    }
  }
}
