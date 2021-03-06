import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:subero_mobile/data/model/comment_model.dart';

class LessonModel {
  late String lessonId; // レッスンの固有ID
  late String lessonName; // レッスン名
  late String lessonDescription; // レッスンの説明
  late String lessonImage; // レッスンのアイコン
  late String skiResort; // ゲレンデ
  late int price; //レッスンの値段
  late num lessonDuration; // レッスンの所要時間
  late String date; // レッスン開催日時
  late List<String> dates; // レッスン開催日時達
  late String category; // カテゴリ？
  late List<dynamic> tags; // タグ

  late DateTime createdAt; // 作成日時
  late DateTime editedAt; // 更新日時

  late String hostId; // ホストID
  late String hostName; // レッスン作成者名
  late String hostIcon; // レッスン作成者のアイコン
  late num hostRating; // ホストの評価値

  late List<CommentModel?> comments; // コメント
  // late num additionalPrice; // 追加料金
  // late int capacity; // 最大人数
  // late bool canTrade; // 取引可能かどうか
  // late bool onlyOnce;  // 単発か継続か

  static const List<dynamic> initTags = [''];
  static const List<String> initDates = [''];
  static const List<CommentModel?> initComments = [];

  LessonModel({
    this.lessonId: 'sample_1',
    this.lessonName: '',
    this.lessonDescription: '',
    this.lessonImage: 'https://firebasestorage.googleapis.com/v0/b/subero-app.appspot.com/o/user_icon%2F308866.png?alt=media&token=dfc47611-1203-4953-be36-7c6bf9806cb3',
    this.skiResort: '',
    this.price: 0,
    this.lessonDuration: 0,
    this.date: '',
    this.dates: initDates,
    this.category: '',
    this.tags: initTags,
    // required this.createdAt,
    // required this.editedAt,
    this.hostId: '',
    this.hostName: '',
    this.hostIcon: 'https://firebasestorage.googleapis.com/v0/b/subero-app.appspot.com/o/user_icon%2F308866.png?alt=media&token=dfc47611-1203-4953-be36-7c6bf9806cb3',
    this.hostRating: 0,
    this.comments: initComments,
  });

  LessonModel.fromDocumentSnapshot({required DocumentSnapshot documentSnapshot}) {
    this.lessonId = documentSnapshot.id;
    this.lessonName = documentSnapshot['lesson_name'];
    this.lessonDescription = documentSnapshot['lesson_description'];
    this.lessonImage = documentSnapshot['lesson_image_url'];
    this.skiResort = documentSnapshot['ski_resort'];
    this.price = documentSnapshot['price'];
    this.lessonDuration = documentSnapshot['lesson_duration'];
    this.date = documentSnapshot['date'];
    // this.dates = documentSnapshot['dates'];
    this.category = documentSnapshot['category'];
    this.tags = documentSnapshot['tags'];

    this.createdAt = documentSnapshot['created_at'].toDate();
    this.editedAt = documentSnapshot['edited_at'].toDate();

    this.hostId = documentSnapshot['host_id'];
    this.hostName = documentSnapshot['host_name'];
    this.hostIcon = documentSnapshot['host_icon_url'];
    this.hostRating = documentSnapshot['host_rating'];

    final _comments = documentSnapshot['comments'];
    if (_comments == null)
      this.comments = [];
    else
      this.comments = [for (int i = 0; i < _comments.length; i++) CommentModel.fromMap(map: _comments[i])];
  }

  LessonModel.fromQueryDocumentSnapshot({required QueryDocumentSnapshot snapshot}) {
    this.lessonId = snapshot.id;
    this.lessonName = snapshot['lesson_name'];
    this.lessonDescription = snapshot['lesson_description'];
    this.lessonImage = snapshot['lesson_image_url'];
    this.skiResort = snapshot['ski_resort'];
    this.price = snapshot['price'];
    this.lessonDuration = snapshot['lesson_duration'];
    this.date = snapshot['date'];
    // this.dates = snapshot['dates'];
    this.category = snapshot['category'];
    this.tags = snapshot['tags'];

    this.createdAt = snapshot['created_at'].toDate();
    this.editedAt = snapshot['edited_at'].toDate();

    this.hostId = snapshot['host_id'];
    this.hostName = snapshot['host_name'];
    this.hostIcon = snapshot['host_icon_url'];
    this.hostRating = snapshot['host_rating'];

    final _comments = snapshot['comments'];
    if (_comments == null)
      this.comments = [];
    else
      this.comments = [for (int i = 0; i < _comments.length; i++) CommentModel.fromMap(map: _comments[i])];
  }
}
