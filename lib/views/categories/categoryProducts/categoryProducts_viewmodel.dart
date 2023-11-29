import 'package:flutter/material.dart';
import 'package:gin/constants/strings.dart';
import 'package:gin/models/product.dart';
import 'package:gin/services/fake_store_services.dart';
import 'package:go_router/go_router.dart';

class CategoryProductsViewModel {
  List<Product>? products;

  final FakeStoreService _fakeStoreService = FakeStoreService();

  Future<void> getProducts(String category) async {
    products =
        await _fakeStoreService.getProducts(category: '/category/$category');
  }

  navigateToHome(BuildContext context) {
    context.go(homeRoute);
  }
}
