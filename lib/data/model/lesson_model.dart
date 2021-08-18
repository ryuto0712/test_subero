// LessonCardに表示させる情報
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

  late List<CommentModel>? comments; // コメント
  // late num additionalPrice; // 追加料金
  // late int capacity; // 最大人数
  // late bool canTrade; // 取引可能かどうか
  // late bool onlyOnce;  // 単発か継続か

  static const List<dynamic> initTags = [''];
  static const List<String> initDates = [''];
  static const List<CommentModel>? initComments = [];

  LessonModel({
    this.lessonId: '',
    this.lessonName: '',
    this.lessonDescription: '',
    this.lessonImage: 'images/app_icon.png',
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
    this.hostIcon: 'images/app_icon.png',
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
    this.comments = [for (int i = 0; i < _comments.length; i++) CommentModel.fromMap(map: _comments[i])];
  }
}
