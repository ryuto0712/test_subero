import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:subero_mobile/data/model/comment_model.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'dart:io';

import 'package:subero_mobile/data/model/lesson_model.dart';

// TODO: cloud strageへのアップロード，URLの取得
// TODO: 複数クエリ検索

class LessonProvider extends GetConnect {
  final CollectionReference lessons = FirebaseFirestore.instance.collection('lessons');
  FirebaseStorage storage = FirebaseStorage.instance;

  Future<LessonModel> getLesson(String lessonId) async {
    try {
      DocumentSnapshot _doc = await this.lessons.doc(lessonId).get();
      var lesson = LessonModel.fromDocumentSnapshot(documentSnapshot: _doc);
      return lesson;
    } catch (e) {
      print('Lesson Privider Error: $e');
      rethrow;
    }
  }

  // 検索，動作未確認
  Future<List<LessonModel>> searchLessons(List queries) async {
    // https://zenn.dev/mamushi/articles/a5e6c9f71e6ea4
    // https://qiita.com/kabochapo/items/1ef39942ac1206c38b2d
    // https://zenn.dev/tentel/articles/ea7d5c03e68e6d142d98

    try {
      // 複数クエリで検索良い感じに実装しようとしたけどできてない
      // dynamic _docs = this.lessons;

      // queries.forEach((query) => {
      //       if (query[0] == 'where')
      //         {
      //           _docs = _docs.where(query[1], query[2], query[3]),
      //         }
      //       else if (query[0] == 'orderBy')
      //         {
      //           _docs = _docs.orderBy(query[1], descending: query[2]),
      //         }
      //     });
      // QuerySnapshot snapshot = await _docs.get();

      List query = queries[0];
      late QuerySnapshot snapshot;
      if (query[0] == 'orderBy') {
        snapshot = await this.lessons.orderBy(query[1], descending: query[2]).get();
        print('orderByでデータ取得完了');
      } else if (query[0] == 'where') {
        if (query[2] == '==') snapshot = await this.lessons.where(query[1], isEqualTo: query[3]).get();
        if (query[2] == '<=') snapshot = await this.lessons.where(query[1], isLessThanOrEqualTo: query[3]).get();
        if (query[2] == '>=') snapshot = await this.lessons.where(query[1], isGreaterThanOrEqualTo: query[3]).get();
        if (query[2] == 'array-contains') snapshot = await this.lessons.where(query[1], arrayContains: query[3]).get();
        if (query[2] == 'array-contains-any') snapshot = await this.lessons.where(query[1], arrayContainsAny: query[3]).get();
        if (query[2] == 'in')
          snapshot = await this.lessons.where(query[1], whereIn: query[3]).get();
        else
          print('検索方法を正しく入力してください: query = ${query}');
        print('whereでデータ取得完了');
      }

      final List<LessonModel> lessons = [];
      snapshot.docs.forEach((_doc) => {lessons.add(LessonModel.fromQueryDocumentSnapshot(snapshot: _doc))});

      return lessons;
    } catch (e) {
      print('Lesson Privider Error (searchLessons): $e');
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
        'comments': [],
      }).then((value) => {lessonId = value.id});

      return lessonId;
    } catch (e) {
      print('Lesson Privider Error: $e');
      rethrow;
    }
  }

  // レッスンの投稿
  Future<bool> editLesson(String lessonId, LessonModel lessonModel) async {
    try {
      await lessons.doc(lessonId).update({
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

        // 'created_at': lessonModel.createdAt,
        'edited_at': lessonModel.editedAt,

        // 'host_id': lessonModel.hostId,
        // 'host_name': lessonModel.hostName,
        // 'host_icon_url': lessonModel.hostIcon,
        // 'host_rating': lessonModel.hostRating,
        // 'comments': lessonModel.comments,
      });

      return true;
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

  Future<String> uploadImage(File file, String fileName) async {
    UploadTask task = storage.ref("lesson_image").child('${DateTime.now().toString()}-$fileName').putFile(file);
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
