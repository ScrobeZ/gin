import 'package:flutter/material.dart';
import 'package:gin/constants/strings.dart';
import 'package:gin/services/auth_services.dart';
import 'package:go_router/go_router.dart';

class LoginViewModel {
  final FirebaseAuthService _auth = FirebaseAuthService();
  bool rememberPassword = false;

  Future<dynamic> signIn(String email, String password) async {
    var result = await _auth.signInEmailPassword(email, password);

    if (email.isEmpty) {
      return 'Ingresa el correo eléctronico';
    }

    if (password.isEmpty) {
      return 'Ingresa la contraseña';
    }

    return result;
  }

  rememberPasswordChanged() {
    rememberPassword = !rememberPassword;
  }

  navigateToHome(BuildContext context) {
    context.go(dashboardRoute);
  }

  navigateToRegister(BuildContext context) {
    context.push(registerRoute);
  }
}
