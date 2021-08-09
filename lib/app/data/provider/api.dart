// ご覧のとおり、必須パラメータを持つMyApiClientクラス、httpオブジェクトを持っています。この例では、APIに対するすべての要求を行うために使用されるクライアント。
// 最後に、私たちは、紙として持っている私たちのメソッドgetAllを持って、APIからすべての投稿を回復します.
// 今後、メソッドを追加します。

import 'dart:convert';
import 'package:subero_mobile/app/data/model/model.dart';
import 'package:http/http.dart' as http;
import 'package:meta/meta.dart';

//nossa url base
const baseUrl = 'https://jsonplaceholder.typicode.com/posts/';

//nossa classe responsável por encapsular os métodos http
class MyApiClient {
//seu client http, pode ser http, http.Client, dio, apenas traga seus métodos para cá e funcionarão normalmente :D
  final http.Client? httpClient;
  MyApiClient({@required this.httpClient});

  //um exemplo rápido, aqui estamos recuperando todos os posts disponibilizados pela api(100)
  getAll() async {
    try {
      var response = await httpClient?.get(Uri(scheme: baseUrl)); // 適当
      if (response != null) {
        if (response.statusCode == 200) {
          Iterable jsonResponse = json.decode(response.body);
          List<MyModel> listMyModel = jsonResponse.map((model) => MyModel.fromJson(model)).toList();
          return listMyModel;
        } else
          print('erro');
      } else
        print('error');
    } catch (_) {}
  }
}
