import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:subero_mobile/main.dart';
import 'package:subero_mobile/ui/screens/auth/sign_in.dart';
import '../../data/repository/auth_repository.dart';
import '../../data/repository/user_repository.dart';
import '../../main.dart';

class AuthController extends GetxController {
  final GetStorage box = GetStorage();
  final AuthRepository authRepository;
  final UserRepository userRepository;
  AuthController({required this.authRepository, required this.userRepository});

  RxString email = ''.obs;
  RxString password = "".obs;
  RxString name = "".obs;

  void emailChanged(String value) => email.value = value;
  void passwordChanged(String value) => password.value = value;
  void nameChanged(String value) => name.value = value;

  registerUser() async {
    try {
      final userId =
          await authRepository.registerUser(email.value, password.value);
      await userRepository.createNewUser(userId, name.value);
      box.write("userName", name.value);
      box.write("userId", userId);
      Get.to(MyApp());
    } catch (e) {
      print('Controller Error: $e');
      rethrow;
    }
  }

  signInWithEmail() async {
    try {
      await authRepository.signInWithEmail(email.value, password.value);
      Get.to(MyApp());
    } catch (e) {
      print('Controller Error: $e');
      rethrow;
    }
  }

  signInWithGoogle() async {
    try {
      await authRepository.signInWithGoogle();
      Get.to(MyApp());
    } catch (e) {
      print('Controller Error: $e');
      rethrow;
    }
  }

  loginCheck() {
    try {
      authRepository.loginCheck();
    } catch (e) {
      print("controller error: $e");
      Get.to(SignIn());
    }
  }
}
