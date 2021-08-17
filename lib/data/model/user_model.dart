import 'package:cloud_firestore/cloud_firestore.dart';

// user関係の情報
class UserData {
  late String id; //documentのid
  late String name; // 名前
  late String introduction; // 紹介文
  late String accountType; //プロorプラチナorノーマル
  late int playedYear; //スノボ歴
  late String favoTrick; //得意技、得意種目
  late String sponser; // スポンサー(あれば)
  late String license; //イントラ資格とか(あれば)
  late String homeGerende; //ホームゲレンデ
  late String createdAt; //作成日
  late String iconUrl; //アイコンの参照元
  late String videoUrl; //ビデオの参照元

  UserData({
    this.id: '',
    this.name: '',
    this.introduction: '',
    this.accountType: '',
    this.playedYear: 0,
    this.favoTrick: "",
    this.sponser: '',
    this.license: '',
    this.homeGerende: '',
    this.createdAt: '',
    this.iconUrl: '',
    this.videoUrl: '',
  });

  UserData.fromDocumentSnapshot({required DocumentSnapshot documentSnapshot}) {
    this.id = documentSnapshot.id;
    this.name = documentSnapshot["name"];
    this.introduction = documentSnapshot["introduction"];
    this.accountType = documentSnapshot["accountType"];
    this.playedYear = documentSnapshot["playedYear"];
    this.favoTrick = documentSnapshot["favoTrick"];
    this.sponser = documentSnapshot["sponser"];
    this.license = documentSnapshot["license"];
    this.homeGerende = documentSnapshot["homeGerende"];
    this.createdAt = documentSnapshot["createdAt"];
    this.iconUrl = documentSnapshot["iconUrl"];
    this.videoUrl = documentSnapshot["videoUrl"];
    print("名前付きコンストラクタが走りました。" + this.name);
  }
}