import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:subero_mobile/data/model/comment_model.dart';

import 'package:subero_mobile/data/model/lesson_model.dart';

class LessonProvider extends GetConnect {
  final CollectionReference lessons = FirebaseFirestore.instance.collection('lessons');
// Get request

  Future<LessonModel> getLesson(String lessonId) async {
    try {
      DocumentSnapshot _doc = await this.lessons.doc(lessonId).get();
      var lesson = LessonModel.fromDocumentSnapshot(documentSnapshot: _doc);
      return lesson;
    } catch (e) {
      print('Privider Error: $e');
      rethrow;
    }
  }

  Future<void> addComment(String lessonId, CommentModel comment) {
    print('providerなう');
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
