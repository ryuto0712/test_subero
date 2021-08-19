import 'package:cloud_firestore/cloud_firestore.dart';

// user関係の情報
class UserModel {
  late String id; //documentのid
  late String name; // 名前
  late String introduction; // 紹介文
  late String accountType; //プロorプラチナorノーマル
  late int career; //スノボ歴
  late String favoriteTrick; //得意技、得意種目
  late String sponser; // スポンサー(あれば)
  late String license; //イントラ資格とか(あれば)
  late String homeSkiResort; //ホームゲレンデ
  late DateTime createdAt; //作成日
  late DateTime editedAt;
  late String iconUrl; //アイコンの参照元
  late String videoUrl; //ビデオの参照元

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
    // this.createdAt: '',
    // this.editedAt:"",
    this.iconUrl: '',
    this.videoUrl: '',
  });

  UserModel.fromDocumentSnapshot({required DocumentSnapshot documentSnapshot}) {
    this.id = documentSnapshot.id;
    this.name = documentSnapshot["name"];
    this.introduction = documentSnapshot["introduction"];
    this.accountType = documentSnapshot["account_type"];
    this.career = documentSnapshot["career"];
    this.favoriteTrick = documentSnapshot["favorite_trick"];
    this.sponser = documentSnapshot["sponser"];
    this.license = documentSnapshot["license"];
    this.homeSkiResort = documentSnapshot["home_ski_resort"];
    this.createdAt = documentSnapshot["created_at"].toDate();
    this.editedAt = documentSnapshot["edited_at"].toDate();
    this.iconUrl = documentSnapshot["icon_url"];
    this.videoUrl = documentSnapshot["video_url"];
  }
}
