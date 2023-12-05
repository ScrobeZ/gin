import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gin/constants/strings.dart';
import 'package:gin/services/auth_services.dart';
import 'package:go_router/go_router.dart';

class StartUpViewModel {
  final FirebaseAuthService _auth = FirebaseAuthService();

  navigateToLogin(BuildContext context) {
    context.pushReplacement(loginRoute);
  }

  navigateToHome(BuildContext context) {
    context.go(dashboardRoute);
  }

  Future<void> checkUser(BuildContext context) async {
    User? user = _auth.instance.currentUser;

    if (user != null) {
      // El usuario ya ha iniciado sesión
      Future.delayed(Duration(seconds: 2)).then(
        (value) {
          navigateToHome(context);
        },
      );
    } else {
      Future.delayed(Duration(seconds: 2)).then(
        (value) {
          navigateToLogin(context);
        },
      );
    }
  }
}
