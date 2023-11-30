import 'package:flutter/material.dart';
import 'package:gin/constants/strings.dart';
import 'package:go_router/go_router.dart';

class DrawerViewModel {
  navigateToCategory(BuildContext context) {
    context.push(categoryRoute);
  }

  navigateToHome(BuildContext context) {
    context.push(dashboardRoute);
  }
}
