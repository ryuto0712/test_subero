class UserInformationModel {
  late String userId; //documentのid
  late String userName; // 名前
  late String? userIcon; //アイコンの参照元
  late int? userRating; //ビデオの参照元

  UserInformationModel({
    this.userId: '',
    this.userName: '',
    this.userIcon,
    this.userRating,
  });

}