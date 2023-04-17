import 'package:dio/dio.dart';
import 'dart:convert';

import '../converter/product_list_converter.dart';

class StylishProvider {
  final dio = Dio();
  static const host = 'https://api.appworks-school.tw';
  static const apiVersion = '1.0';
  static const url = '$host/api/$apiVersion';

  Future<ProductList> fetchProductList(String type) async {
    Response response = await dio.get('$host/products/$type');
    return Future(() => productListFromJson(json.encode(response.data)));
  }
}
