import '../provider/auth_provider.dart';

class AuthRepository {
  final AuthProvider authProvider;

  AuthRepository({required this.authProvider});

  registerUser(String email, String password) {
    return authProvider.registerUser(email, password);
  }

  signInWithEmail(String email, String password) {
    return authProvider.signInWithEmail(email, password);
  }

  loginCheck() {
    return authProvider.loginCheck();
  }

  signInWithGoogle() {
    return authProvider.signInWithGoogle();
  }

  signOutUser() {
    return authProvider.signOutUser();
  }
}
  // resetPassword(String email) {
  //   return authProvider.resetPassword(email);
  // }
