import 'package:flutter/material.dart';
import 'package:gin/constants/strings.dart';
import 'package:gin/models/product.dart';
import 'package:gin/services/fake_store_services.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ShoppingCartViewModel {
  bool isAnyProducts = false;
  bool isBusy = false;
  List<Product> products = [];

  final FakeStoreService _fakeStoreService = FakeStoreService();

  Future<List<Product>> getCart() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    var ids = prefs.getStringList('cart')!.map((e) {
      return int.tryParse(e);
    }).toList();

    for (var i = 0; i < ids.length; i++) {
      products.add(await _fakeStoreService.getProduct(ids[i]!));
    }

    return products;
  }

  Future<bool> checkIfIstherProducts() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    if (prefs.getStringList('cart') == null) {
      prefs.setStringList('cart', []);
      return false;
    } else {
      if (prefs.getStringList('cart')!.isEmpty) {
        return false;
      }
      await getCart();
      return true;
    }
  }

  Future<void> purchase() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.clear();
  }

  navigateToHome(BuildContext context) {
    context.go(dashboardRoute);
  }
}
