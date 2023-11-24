import 'package:dio/dio.dart';
import 'package:gin/constants/strings.dart';
import 'package:gin/models/product.dart';

class FakeStoreService {
  final _dio = Dio();
  Future<dynamic> getProduct(int productId) async {
    try {
      final response = await _dio.get(fakeStoreURL + '/products/$productId');
      if (response.statusCode == 200 && response.data != null) {
        final product = Product.fromJson(response.data);
        return product;
      } 
    } on DioException catch (e) {
      return e.response!.data;
    }
  }

  Future<dynamic> getProducts() async {
    try {
      final response = await _dio.get(fakeStoreURL + '/products');
      if (response.statusCode == 200 && response.data != null) {
        final products =
            (response.data as List).map((e) => Product.fromJson(e)).toList();
        return products;
      }
    } on DioException catch (e) {
      return e.response!.data;
    }
  }
}
