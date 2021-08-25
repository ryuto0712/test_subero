import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../../data/repository/auth_repository.dart';
import '../../data/repository/user_repository.dart';
import '../../ui/screens/home/home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

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
      final userId = await authRepository.registerUser(email.value, password.value);
      await userRepository.createNewUser(userId, name.value);
      box.write("userName", name.value);
      box.write("userId", userId);
      // Get.toNamed("/home");
      Get.to(Home());
    } catch (e) {
      print('Controller Error: $e');
      rethrow;
    }
  }
}




// import 'package:connectivity/connectivity.dart';
// import 'package:email_validator/email_validator.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_easyloading/flutter_easyloading.dart';
// import 'package:get/get.dart';

// class AuthController extends GetxController {
//   GlobalKey<FormState> forgotPasswordEmailFormKey = GlobalKey<FormState>();
//   GlobalKey<ScaffoldState> forgotPasswordEmailScaffoldKey =
//       GlobalKey<ScaffoldState>();
//   final FirebaseAuth _auth = FirebaseAuth.instance;
//   final FirebaseMessaging _fcm = FirebaseMessaging.instance;
//   final AuthService _authService = AuthService();
//   final UserService _userService = UserService();
//   var connectionStatus = 0.obs;
//   final Connectivity _connectivity = Connectivity();
//   Rxn<User> firebaseUser = Rxn<User>();
//   // RxBool isEmailVerified = false.obs;
//   late TextEditingController forgotPassEmailController;

//   RxString forgotPassEmail = ''.obs;
//   RxnString forgotPassEmailErrorText = RxnString(null);

//   @override
//   void onInit() {
//     super.onInit();
//     initConnectivity();
//     forgotPassEmailController = TextEditingController();
//     // User isEmailVerified = _auth.currentUser!..reload();
//   }

//   @override
//   void onReady() async {
//     ever(firebaseUser, handleAuthChanged);
//     firebaseUser.bindStream(user);
//     super.onReady();
//   }

//   handleAuthChanged(_firebaseUser) async {
//     if (_firebaseUser != null) {
//       Get.offNamed(Routes.DASHBOARD);
//     }
//   }

