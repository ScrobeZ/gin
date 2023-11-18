import 'package:gin/models/product.dart';
import 'package:gin/services/fake_store_services.dart';

class ShoppingCartViewModel {
  bool isAnyProducts = false;
  bool isBusy = false;

  int productLength = 1;

  final FakeStoreService _fakeStoreService = FakeStoreService();

  Future<Product> getProduct(int id) async {
    return await _fakeStoreService.getProduct(1);
  }
}
