// LessonCardに表示させる情報
class LessonData {
  String lessonName; // レッスン名
  String hostName; // レッスン作成者
  String lessonIcon; // レッスンのアイコン
  String hostIcon; // レッスン作成者のアイコン
  int price; //レッスンの値段
  String comment; // コメント
  String lessonId; // レッスンの固有ID

  LessonData({
    this.lessonName: 'レッスン名',
    this.hostName: 'ユーザー名',
    this.lessonIcon: 'images/app_icon.png',
    this.hostIcon: 'images/app_icon.png',
    this.price: 0,
    this.comment: 'sample comment',
    this.lessonId: 'xxxxx',
  });
}
