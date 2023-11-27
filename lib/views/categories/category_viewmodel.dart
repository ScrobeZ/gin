import 'package:flutter/material.dart';
import 'package:gin/config/helpers/translations.dart';
import 'package:gin/constants/strings.dart';
import 'package:gin/services/fake_store_services.dart';
import 'package:go_router/go_router.dart';

class CategoryViewModel {
  List<String>? categories;

  final FakeStoreService _fakeStoreService = FakeStoreService();

  Future<void> getCategories() async {
    categories = await _fakeStoreService.getCategories();
    categories = Translations().translateCategories(categories!);
    print(categories);
  }

  navigateToCategoryProducts(BuildContext context) {
    context.push(categoryProductsRoute);
  }
}
