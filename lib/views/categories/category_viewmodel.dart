import 'package:flutter/material.dart';
import 'package:gin/config/helpers/translations.dart';
import 'package:gin/constants/strings.dart';
import 'package:gin/services/fake_store_services.dart';
import 'package:go_router/go_router.dart';

class CategoryViewModel {
  List<String>? categoriesES;
  List<String>? categoriesEN;

  final FakeStoreService _fakeStoreService = FakeStoreService();

  Future<void> getCategories() async {
    categoriesEN = await _fakeStoreService.getCategories();
    categoriesES = Translations().translateCategories(categoriesEN!);
  }

  navigateToCategoryProducts(BuildContext context, int index) {
    context.push('$categoryProductsRoute/${categoriesEN![index]}');
  }
}
