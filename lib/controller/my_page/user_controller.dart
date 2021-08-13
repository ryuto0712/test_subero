import 'package:get/get.dart';
import '../../data/model/user_model.dart';
import '../../data/repository/test_repository.dart';
import "../../data/model/models.dart";
import "../../data/repository/repositorys.dart";

class UserController extends GetxController {
  final UserRepository repository;
  UserController({required this.repository});

  final _user = UserData().obs;
  get user => this._user.value;
  set user(value) => this._user.value = value;

  getUser(String uid) async {
    print("コントローラで値の取得を始めました");
    try {
      _user.value = await repository.getUser(uid);
      print("コントローラで値を取得しました。" + _user.value.name);
    } catch (e) {
      print(e.toString());
      print("controller error");
    }
  }
}
