import 'package:dio/dio.dart';
import 'package:gin/constants/strings.dart';
import 'package:gin/models/cart.dart' as cart;
import 'package:gin/models/product.dart';

class FakeStoreService {
  final _dio = Dio();
  Future<dynamic> getProduct(int productId) async {
    try {
      final response = await _dio.get('$fakeStoreURL/products/$productId');
      if (response.statusCode == 200 && response.data != null) {
        final product = Product.fromJson(response.data);
        return product;
      }
    } on DioException catch (e) {
      return e.response!.data;
    }
  }

  Future<dynamic> getProducts({String category = ''}) async {
    try {
      final response = await _dio.get('$fakeStoreURL/products$category');
      if (response.statusCode == 200 && response.data != null) {
        final products =
            (response.data as List).map((e) => Product.fromJson(e)).toList();
        return products;
      }
    } on DioException catch (e) {
      return e.response!.data;
    }
  }

  Future<dynamic> getCategories() async {
    try {
      final response = await _dio.get('$fakeStoreURL/products/categories');
      if (response.statusCode == 200 && response.data != null) {
        final List<dynamic> list = response.data;
        return list.map((e) => e.toString()).toList();
      }
    } on DioException catch (e) {
      return e.response!.data;
    }
  }

  Future<dynamic> getCart() async {
    try {
      final response = await _dio.get('$fakeStoreURL/carts/5');
      if (response.statusCode == 200 && response.data != null) {
        final cartProducts = cart.Cart.fromJson(response.data);
        print(cartProducts);
        return cartProducts;
      }
    } on DioException catch (e) {
      return e.response!.data;
    }
  }
}
