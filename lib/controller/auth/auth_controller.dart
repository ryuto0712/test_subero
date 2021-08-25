import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:subero_mobile/main.dart';
import 'package:subero_mobile/ui/screens/auth/sign_up.dart';
import '../../data/repository/auth_repository.dart';
import '../../data/repository/user_repository.dart';
import '../../ui/screens/home/home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import '../../main.dart';

class AuthController extends GetxController {
  final GetStorage box = GetStorage();
  final AuthRepository authRepository;
  final UserRepository userRepository;
  AuthController({required this.authRepository, required this.userRepository});

  RxString email = ''.obs;
  RxString password = "".obs;
  RxString name = "".obs;
  // late RxBool loggedIn ;

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

  loginFromEmail() async {
    try {
      await authRepository.loginFromEmail(email.value, password.value);
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
      Get.to(SignUp());
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
