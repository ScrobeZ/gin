import 'package:dio/dio.dart';
import 'package:gin/constants/strings.dart';
import 'package:gin/models/cart.dart';
import 'package:gin/models/product.dart';
import 'package:shared_preferences/shared_preferences.dart';

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

  Future<dynamic> getCart(int id) async {
    try {
      final response = await _dio.get('$fakeStoreURL/carts/$id');
      if (response.statusCode == 200 && response.data != null) {
        final cartProducts = Cart.fromJson(response.data);
        return cartProducts;
      } else {
        return null;
      }
    } on DioException catch (e) {
      return e.response!.data;
    }
  }

  Future<bool> addCart(int id) async {
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      if (prefs.getStringList('cart') == null) {
        prefs.setStringList('cart', ['$id']);
        return true;
      } else {
        if (prefs.getStringList('cart')!.isEmpty) {
          prefs.clear();
          prefs.setStringList('cart', ['$id']);
          return true;
        } else {
          var list = prefs.getStringList('cart')!;
          prefs.clear();

          prefs.setStringList('cart', [...list, '$id']);
          return true;
        }
      }
    } on DioException catch (e) {
      print(e.response!.statusCode);
      print(e.response!.data);
      return false;
    }
  }

  Future getProductByNameTest(String name) async {
    try {
      final response = await _dio.get('$fakeStoreURL/products');

      if (response.statusCode == 200 && response.data != null) {
        List<dynamic> products = response.data;

        List<dynamic> filteredProducts = products
            .where((product) => product['title']
                .toString()
                .toLowerCase()
                .contains(name.toLowerCase()))
            .toList();

        return filteredProducts.map((obj) => Product.fromJson(obj)).toList();
      }
    } on DioException catch (e) {
      return e;
    }
  }
}
