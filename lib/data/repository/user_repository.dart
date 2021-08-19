import '../provider/user_provider.dart';
import "../provider/providers.dart";
import "../model/user_model.dart";

class UserRepository {
  final UserProvider userProvider;

  UserRepository({required this.userProvider});

  getUser(String uid) {
    return userProvider.getUser(uid);
  }

  createNewUser(UserModel userModel) {
    return userProvider.createNewUser(userModel);
  }

  editProfile(UserModel userModel, String uid) {
    return userProvider.editProfile(userModel, uid);
  }
}
