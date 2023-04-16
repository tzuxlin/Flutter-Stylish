

import '../model/product.dart';
import '../model/product_category.dart';

class ProductRepository {
  Future<List<Product>> fetchProducts(ProductCategory category) {
    Future.delayed(const Duration(seconds: 1));
    return Future(() => [
      Product(
          id: 1,
          title: 'ショートマウンテンパーカー',
          image: 'assets/images/product_1.jpeg',
          price: 1960),
      Product(
          id: 2,
          title: 'ボリュームショートライダース',
          image: 'assets/images/product_2.jpeg',
          price: 1960),
      Product(
          id: 3,
          title: 'シアーギャザーサンダル',
          image: 'assets/images/product_3.jpeg',
          price: 1590),
      Product(
          id: 2,
          title: 'ボリュームショートライダース',
          image: 'assets/images/product_2.jpeg',
          price: 1960),
      Product(
          id: 1,
          title: 'ショートマウンテンパーカー',
          image: 'assets/images/product_1.jpeg',
          price: 1960),
    ]);
  }
}
