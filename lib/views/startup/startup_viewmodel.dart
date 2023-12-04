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
    if (_auth.instance.currentUser != null) {
      _auth.instance.currentUser?.getIdTokenResult().then((value) {
        Future.delayed(Duration(seconds: 2));
        navigateToHome(context);
      });
    } else {
      navigateToLogin(context);
    }
  }
}
