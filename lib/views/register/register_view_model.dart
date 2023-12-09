import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gin/config/helpers/text_helpers.dart';
import 'package:gin/constants/strings.dart';
import 'package:gin/services/auth_services.dart';
import 'package:go_router/go_router.dart';

class RegisterViewModel with TextHelpers {
  final FirebaseAuthService _auth = FirebaseAuthService();

  bool rememberPassword = false;
  bool isSigningUp = false;
  late final User? user;
  String errorMessage = '';

  Future<dynamic> signUp(String username, String email, String password,
      String passwordConfirm) async {
    if (!areEmpty([username, email, password, passwordConfirm])) {
      return 'Ingresa los datos';
    }

    if (!_checkConfirmPassword(password, passwordConfirm)) {
      return 'Las contraseñas no coincide';
    }

    var result = await _auth.signUpEmailPassword(email, password, username);
    return result;
  }

  bool _checkConfirmPassword(String password, String passwordConfirm) {
    return password == passwordConfirm;
  }

  rememberPasswordChanged() {
    rememberPassword = !rememberPassword;
  }

  navigateToLogin(BuildContext context) {
    context.go(loginRoute);
  }
}
