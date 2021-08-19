import 'package:get/get.dart';
import '../../data/model/user_model.dart';
import '../../data/repository/user_repository.dart';
import "../../data/model/models.dart";
import "../../data/repository/repositorys.dart";

class UserController extends GetxController {
  final UserRepository repository;
  UserController({required this.repository});

  final _user = UserModel().obs;
  get user => this._user.value;
  set user(value) => this._user.value = value;

  getUser(String uid) async {
    try {
      _user.value = await repository.getUser(uid);
    } catch (e) {
      print("controller error:$e");
    }
  }
}
