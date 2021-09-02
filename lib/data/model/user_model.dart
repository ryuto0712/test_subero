import 'package:cloud_firestore/cloud_firestore.dart';

// user関係の情報
class UserModel {
  late String id; //documentのid
  late String name; // 名前
  late String? introduction; // 紹介文
  late String? accountType; //プロorプラチナorノーマル
  late int? career; //スノボ歴
  late String? favoriteTrick; //得意技、得意種目
  late String? sponser; // スポンサー(あれば)
  late String? license; //イントラ資格とか(あれば)
  late String? homeSkiResort; //ホームゲレンデ
  late DateTime? createdAt; //作成日
  late DateTime? editedAt;
  late String? iconUrl; //アイコンの参照元
  late String? videoUrl; //ビデオの参照元
  late int? rating;
  late List<String> postedLessons; // 投稿済みのレッスン

  static const List<String> initPostedLessons = [];

  UserModel({
    this.id: '',
    this.name: '',
    this.introduction: '',
    this.accountType: '',
    this.career: 0,
    this.favoriteTrick: "",
    this.sponser: '',
    this.license: '',
    this.homeSkiResort: '',
    this.createdAt: null,
    this.editedAt: null,
    this.iconUrl: '',
    this.videoUrl: '',
    this.rating: 0,
    this.postedLessons: initPostedLessons,
  }) {
    // print("コンストラクタが走りました。");
  }

  UserModel.fromDocumentSnapshot({required DocumentSnapshot documentSnapshot}) {
    this.id = documentSnapshot.id;
    this.name = documentSnapshot["name"];
    this.introduction = documentSnapshot["introduction"] ?? "未設定";
    this.accountType = documentSnapshot["account_type"] ?? "未設定";
    this.career = documentSnapshot["career"] ?? 0;
    this.favoriteTrick = documentSnapshot["favorite_trick"] ?? "未設定";
    this.sponser = documentSnapshot["sponser"] ?? "未設定";
    this.license = documentSnapshot["license"] ?? "未設定";
    this.homeSkiResort = documentSnapshot["home_ski_resort"] ?? "未設定";
    this.createdAt = documentSnapshot["created_at"].toDate() ?? DateTime.now();
    this.editedAt = documentSnapshot["edited_at"].toDate() ?? DateTime.now();
    this.iconUrl = documentSnapshot["icon_url"] ??
        "https://firebasestorage.googleapis.com/v0/b/subero-app.appspot.com/o/user_icon%2F308866.png?alt=media&token=dfc47611-1203-4953-be36-7c6bf9806cb3";
    this.videoUrl = documentSnapshot["video_url"] ??
        "https://firebasestorage.googleapis.com/v0/b/subero-app.appspot.com/o/user_video%2F1?alt=media&token=4e921236-65bf-4c17-bd0b-9f33caee0c97";
    this.rating = documentSnapshot["rating"] ?? 0;
    var _postedLessons = documentSnapshot["posted_lessons"];
    if (_postedLessons == null)
      this.postedLessons = [];
    else {
      this.postedLessons = [
        for (int i = 0; i < _postedLessons.length; i++)
          _postedLessons[i].toString()
      ];
    }
  }
}