import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:subero_mobile/data/model/lesson_model.dart';

class LessonProvider extends GetConnect {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
// Get request

  Future<LessonModel> getLesson(String lessonId) async {
    try {
      DocumentSnapshot _doc = await firestore.collection('lessons').doc(lessonId).get();
      var lesson = LessonModel.fromDocumentSnapshot(documentSnapshot: _doc);
      return lesson;
    } catch (e) {
      print('Privider Error: $e');
      rethrow;
    }
  }
}
