import 'package:gin/models/product.dart';
import 'package:gin/services/fake_store_services.dart';

class DashboardViewModel {
  List<Product>? products;

  final FakeStoreService _fakeStoreService = FakeStoreService();

  Future<void> getProducts() async {
    products = await _fakeStoreService.getProducts();
  }
}
