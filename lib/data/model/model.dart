// getmodel
// 私たちのモデルクラスでは、オブジェクトをjsonまたはオブジェクト内のjsonに変換する責任を負うtoJsonとfromJsonという2つのメソッドと2つのメソッドがあります。
// 通常、API を使用する場合は、これらのメソッドを使用して API の応答からオブジェクトを作成したり、API に送信する json を作成したりします。

class MyModel {
  late int id;
  late String title;
  late String body;

  MyModel({id, title, body});

  MyModel.fromJson(Map<String, dynamic> json) {
    this.id = json['id'];
    this.title = json['title'];
    this.body = json['body'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.title;
    data['body'] = this.body;
    return data;
  }
}
