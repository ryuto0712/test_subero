import '../provider/user_provider.dart';
import "../provider/providers.dart";
import "../model/user_model.dart";
import 'dart:io';

class UserRepository {
  final UserProvider userProvider;

  UserRepository({required this.userProvider});

  getUser(String uid) {
    return userProvider.getUser(uid);
  }

  createNewUser(String email, String name) {
    return userProvider.createNewUser(email, name);
  }

  editProfile(UserModel userModel, String uid) {
    return userProvider.editProfile(userModel, uid);
  }

  uploadImage(File file, String uid, String fileName) {
    return userProvider.uploadImage(file, uid, fileName);
  }

  uploadVideo(File file, String uid, String fileName) {
    return userProvider.uploadVideo(file, uid, fileName);
  }

  addPostedLessons(String lessonId) {
    return userProvider.addPostedLesson(lessonId);
  }
}
