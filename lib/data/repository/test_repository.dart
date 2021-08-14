import '../provider/user_provider.dart';
import "../provider/providers.dart";

class UserRepository {
  final UserProvider userProvider;

  UserRepository({required this.userProvider});
  getUser(String uid) {
    print("レポジトリでgetUserが走りました");
    return userProvider.getUser(uid);
  }
}
