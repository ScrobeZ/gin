import 'package:gin/models/product.dart';
import 'package:gin/services/fake_store_services.dart';

class ProductViewModel {
  final FakeStoreService _fakeStoreService = FakeStoreService();

  Future<Product> getProduct(int id) async {
    return await _fakeStoreService.getProduct(id);
  }
}
