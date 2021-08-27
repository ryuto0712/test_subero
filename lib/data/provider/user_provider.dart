import 'package:cloud_firestore/cloud_firestore.dart';
import '../model/user_model.dart';
import "../model/models.dart";
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get_storage/get_storage.dart';
import 'dart:io';

class UserProvider {
  final CollectionReference users = FirebaseFirestore.instance.collection("users");
  final GetStorage box = GetStorage();

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
  Future<bool> createNewUser(String userId, String name) async {
    try {
      await users.doc(userId).set({
        "name": name,
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
        "posted_lessons": [],
      });
      return true;
    } catch (e) {
      print('Provider Error: $e');
      rethrow;
    }
  }

//ユーザ情報の編集
  Future<bool> editProfile(UserModel userModel, String uid) async {
    try {
      await users.doc(uid).update({
        "name": userModel.name,
        "introduction": userModel.introduction,
        // "account_type": userModel.accountType,
        "career": userModel.career,
        "favorite_trick": userModel.favoriteTrick,
        "sponser": userModel.sponser,
        "license": userModel.license,
        "home_ski_resort": userModel.homeSkiResort,
        // "created_at": userModel.createdAt,
        "edited_at": userModel.editedAt,
        "icon_url": userModel.iconUrl,
        "video_url": userModel.videoUrl,
        // "rating": userModel.rating,
      });
      // getStrageの値の更新
      box.write("userName", userModel.name);
      // box.write("userId", uid);
      box.write("userIcon", userModel.iconUrl);
      // box.write("userRating", userModel.rating);
      return true;
    } catch (e) {
      print('Provider Error: $e');
      rethrow;
    }
  }

  Future<String> uploadImage(File file, String uid, String fileName) async {
    FirebaseStorage storage = FirebaseStorage.instance;
    UploadTask task = storage.ref("user_icon").child('$uid-$fileName').putFile(file);
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
    UploadTask task = storage.ref("user_video").child('$uid-$fileName').putFile(file);
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

  // 新規レッスンの投稿
  Future<bool> addPostedLesson(String lessonId) async {
    try {
      // 配列'posted_lessons'に新しく投稿したlessonIdを追加
      await users.doc(box.read('userId')).update({
        'posted_lessons': FieldValue.arrayUnion([lessonId])
      });
      return true;
    } catch (e) {
      print('投稿済みレッスン情報の更新に失敗しました．$e');
      rethrow;
    }
  }
}
