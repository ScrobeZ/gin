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
  Map<int, int> frecuenciaDeIds = {};

  final FakeStoreService _fakeStoreService = FakeStoreService();

  Future<void> getCart() async {
    products = [];
    frecuenciaDeIds = {};
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    List<int>? listaDeIds = prefs
        .getStringList('cart')!
        .map((e) {
          return int.tryParse(e);
        })
        .cast<int>()
        .toList();

    for (int id in listaDeIds) {
      frecuenciaDeIds[id] = (frecuenciaDeIds[id] ?? 0) + 1;
    }

    frecuenciaDeIds.forEach(
      (id, quantity) async {
        products.add(await _fakeStoreService.getProduct(id));
      },
    );
  }

  Future<bool> checkIfIsthereProducts() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    if (prefs.getStringList('cart') == null) {
      prefs.setStringList('cart', []);
      return false;
    } else {
      if (prefs.getStringList('cart')!.isEmpty) {
        return false;
      }
      await getCart();

      await Future.delayed(Duration(seconds: 1)).then((value) {});
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
