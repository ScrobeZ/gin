import 'package:flutter/material.dart';
import 'package:gin/constants/strings.dart';
import 'package:go_router/go_router.dart';

class CategoryProductsViewModel {
  navigateToHome(BuildContext context) {
    context.go(homeRoute);
  }
}
