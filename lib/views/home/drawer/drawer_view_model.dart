import 'package:flutter/material.dart';
import 'package:gin/constants/strings.dart';
import 'package:gin/services/auth_services.dart';
import 'package:go_router/go_router.dart';

class DrawerViewModel {
  bool isHome = true;
  bool isCategory = false;

  final FirebaseAuthService _auth = FirebaseAuthService();

  Future<void> logOut(BuildContext context) async {
    await _auth.instance.signOut().then((value) {
      context.go(startUpRoute);
    });
  }

  navigateToCategory(BuildContext context) {
    context.push(categoryRoute);
  }

  navigateToHome(BuildContext context) {
    context.push(dashboardRoute);
  }
}
