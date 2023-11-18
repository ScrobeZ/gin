import 'package:flutter/material.dart';
import 'package:gin/constants/strings.dart';
import 'package:gin/models/product.dart';
import 'package:gin/services/fake_store_services.dart';
import 'package:go_router/go_router.dart';

class DashboardViewModel {
  List<Product>? products;

  final FakeStoreService _fakeStoreService = FakeStoreService();

  Future<void> getProducts() async {
    products = await _fakeStoreService.getProducts();
  }

  navigateToProduct(BuildContext context) {
    context.push(productRoute);
  }
}
