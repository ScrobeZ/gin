import 'package:flutter/material.dart';
import 'package:gin/constants/strings.dart';
import 'package:go_router/go_router.dart';

class CategoryViewModel {
  navigateToCategoryProducts(BuildContext context) {
    context.push(categoryProductsRoute);
  }
}
