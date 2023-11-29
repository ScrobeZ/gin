import 'package:gin/models/cart.dart' as shopping_cart;
import 'package:gin/models/product.dart';
import 'package:gin/services/fake_store_services.dart';

class ShoppingCartViewModel {
  bool isAnyProducts = false;
  bool isBusy = false;
  late shopping_cart.Cart cart;

  final FakeStoreService _fakeStoreService = FakeStoreService();

  Future<List<Product>> getCart() async {
    cart = await _fakeStoreService.getCart();

    final List<int> ids;

    List<Product> products = [];

    ids = cart.products.map((e) => e.productId).toList();

    for (var i = 0; i < ids.length; i++) {
      products.add(await _fakeStoreService.getProduct(ids[i]));
    }

    return products;
  }
}
