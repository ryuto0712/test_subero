// ご覧のとおり、必須パラメータを持つMyApiClientクラス、httpオブジェクトを持っています。この例では、APIに対するすべての要求を行うために使用されるクライアント。
// 最後に、私たちは、紙として持っている私たちのメソッドgetAllを持って、APIからすべての投稿を回復します.
// 今後、メソッドを追加します。

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:subero_mobile/data/model/sample_medel.dart';

class SampleProvider extends GetConnect {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

// Get request
  Future<SampleModel> getData(String id) async {
    try {
      DocumentSnapshot _doc = await firestore.collection('users').doc(id).get();
      var user = SampleModel.fromDocumentSnapshot(documentSnapshot: _doc);
      return user;
    } catch (e) {
      print('provider Error: $e');
      rethrow;
    }
  }
}
