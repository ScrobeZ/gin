import 'package:flutter/material.dart';
import 'package:gin/constants/strings.dart';
import 'package:go_router/go_router.dart';

class DrawerViewModel {
  bool isHome = true;
  bool isCategory = false;

  navigateToCategory(BuildContext context) {
    context.push(categoryRoute);
  }

  navigateToHome(BuildContext context) {
    context.push(dashboardRoute);
  }
}
