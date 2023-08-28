import 'package:dio/dio.dart';
import 'package:products_view/view/shared/constant/path_api.dart';

class Api {
  static final dio = Dio();

  static Future<Response> getProducts({int? limit}) async {
    return dio.get(
      productUrl,
      queryParameters: {
        'limit': limit,
      },
    );
  } //end of getProducts

  static Future<Response> getByCategory({String? category}) async {
    return dio.get(
      "${categoryUrl}$category",
    );
  } //end of getProducts

  static Future<Response> getOneProduct({int? id}) async {
    return dio.get(
      '$productUrl/$id',
    );
  } //end of getOneProduct

  static Future<Response> searchProducts({String? keyword}) async {
    return dio.get(
      searchUrl,
      queryParameters: {
        'q': keyword,
      },
    );
  } //end of searchProducts
}
