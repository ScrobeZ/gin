import 'package:flutter/material.dart';
import 'package:gin/constants/strings.dart';
import 'package:go_router/go_router.dart';

class RegisterViewModel {
  bool rememberPassword = false;
  rememberPasswordChanged() {
    rememberPassword = !rememberPassword;
  }

  navigateToHome(BuildContext context) {
    context.go(loginRoute);
  }
}
