import 'package:flutter/material.dart';
import 'package:gin/constants/strings.dart';
import 'package:go_router/go_router.dart';

class HomeViewModel {
  bool isDashboard = true;

  navigateToShoppingCart(BuildContext context) {
    context.push(shoppingCartRoute);
  }

  changeIsDashboard(BuildContext context) {
    isDashboard = !isDashboard;
  }
}
