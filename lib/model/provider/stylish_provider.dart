import 'package:connie_stylish/model/converter/product_detail_converter.dart';
import 'package:dio/dio.dart';

import '../converter/product_list_converter.dart';

class StylishProvider {
  final dio = Dio();
  static const host = 'https://api.appworks-school.tw';
  static const apiVersion = '1.0';
  static const url = '$host/api/$apiVersion';

  Future<ProductListEntity> fetchProductList(String type) async {
    Response response = await dio.get('$url/products/$type');
    return Future(() => ProductListEntity.fromJson(response.data));
  }

  Future<ProductDetailEntity> fetchProductDetail(int id) async {
    Response response = await dio.get(
      '$url/products/details',
      queryParameters: {'id': id},
    );
    return Future(() => ProductDetailEntity.fromJson(response.data));
  }
}
