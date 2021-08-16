// LessonCardに表示させる情報
import 'package:cloud_firestore/cloud_firestore.dart';

class LessonModel {
  late String lessonId; // レッスンの固有ID
  late String lessonName; // レッスン名
  late String lessonDescription; // レッスンの説明
  late String lessonImage; // レッスンのアイコン
  late String skiResort; // ゲレンデ
  late int price; //レッスンの値段
  late num lessonDuration; // レッスンの所要時間
  late String date; // レッスン開催日時
  late String dates; // レッスン開催日時達
  late String category; // カテゴリ？
  // late List<String> tags; // タグ

  // late String createdAt; // 作成日時
  // late String editedAt; // 更新日時

  late String hostId; // ホストID
  late String hostName; // レッスン作成者名
  late String hostIcon; // レッスン作成者のアイコン
  late num hostRating; // ホストの評価値

  // late Map<String, > comment; // コメント
  // late num additionalPrice; // 追加料金
  // late int capacity; // 最大人数
  // late bool canTrade; // 取引可能かどうか
  // late bool onlyOnce;  // 単発か継続か

  LessonModel({
    this.lessonId: '',
    this.lessonName: '',
    this.lessonDescription: '',
    this.lessonImage: '',
    this.skiResort: '',
    this.price: 0,
    this.lessonDuration: 0,
    this.date: '',
    this.dates: '',
    this.category: '',
    // this.tags,

    // this.createdAt,
    // this.editedAt,

    this.hostId: '',
    this.hostName: '',
    this.hostIcon: '',
    this.hostRating: 0,
    // this.comment: '',
  });

  LessonModel.fromDocumentSnapshot({required DocumentSnapshot documentSnapshot}) {
    this.lessonId = documentSnapshot.id;
    this.lessonName = documentSnapshot['lesson_name'];
    this.lessonDescription = documentSnapshot['lesson_description'];
    this.lessonImage = documentSnapshot['lesson_image'];
    this.skiResort = documentSnapshot['ski_resort'];
    this.price = documentSnapshot['price'];
    this.lessonDuration = documentSnapshot['lessonDuration'];
    this.date = documentSnapshot['date'];
    // this.dates = documentSnapshot['dates'];
    this.category = documentSnapshot['category'];

    // this.tags = documentSnapshot[''];
    // this.createdAt = documentSnapshot[''];
    // this.editedAt = documentSnapshot[''];

    this.hostId = documentSnapshot['host_id'];
    this.hostName = documentSnapshot['host_name'];
    this.hostIcon = documentSnapshot['host_icon'];
    this.hostRating = documentSnapshot['host_rating'];
    // this.comment = documentSnapshot[''];
  }
}
