import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:subero_mobile/data/model/comment_model.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

import 'package:subero_mobile/data/model/lesson_model.dart';

// TODO: cloud strageへのアップロード，URLの取得

class LessonProvider extends GetConnect {
  final CollectionReference lessons = FirebaseFirestore.instance.collection('lessons');
  firebase_storage.FirebaseStorage storage = firebase_storage.FirebaseStorage.instance;

  Future<LessonModel> getLesson(String lessonId) async {
    try {
      DocumentSnapshot _doc = await this.lessons.doc(lessonId).get();
      var lesson = LessonModel.fromDocumentSnapshot(documentSnapshot: _doc);
      print('${lesson.lessonId}, ${lesson.lessonName}, レッスン');
      return lesson;
    } catch (e) {
      print('Lesson Privider Error: $e');
      rethrow;
    }
  }

  // レッスンの投稿
  Future<String> postLesson(LessonModel lessonModel) async {
    late String lessonId; // 投稿したレッスンのIDを取得
    try {
      await lessons.add({
        'lesson_name': lessonModel.lessonName,
        'lesson_description': lessonModel.lessonDescription,
        'lesson_image_url': lessonModel.lessonImage,
        'ski_resort': lessonModel.skiResort,
        'price': lessonModel.price,
        'lesson_duration': lessonModel.lessonDuration,
        'date': lessonModel.date,
        // 'dates': lessonModel.dates,
        'category': lessonModel.category,
        'tags': lessonModel.tags,

        'created_at': lessonModel.createdAt,
        'edited_at': lessonModel.editedAt,

        'host_id': lessonModel.hostId,
        'host_name': lessonModel.hostName,
        'host_icon_url': lessonModel.hostIcon,
        'host_rating': lessonModel.hostRating,
        'comments': [], // 投稿時はコメントが無いので空の配列にする
      }).then((value) => {lessonId = value.id});

      return lessonId;
    } catch (e) {
      print('Lesson Privider Error: $e');
      rethrow;
    }
  }

  Future<void> addComment(String lessonId, CommentModel comment) {
    return this.lessons.doc(lessonId).update({
      'comments': FieldValue.arrayUnion([
        {
          'user_id': comment.userId,
          'user_icon_url': comment.userIcon,
          'user_name': comment.userName,
          'contents': comment.contents,
          'created_at': comment.createdAt,
        }
      ])
    });
  }
}
