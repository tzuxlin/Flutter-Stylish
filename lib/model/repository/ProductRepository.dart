import 'package:connie_stylish/model/provider/stylish_provider.dart';

import '../model/product.dart';
import '../model/product_category.dart';

class ProductRepository {

  final stylishProvider = StylishProvider();

  Future<List<Product>> fetchProducts(ProductCategory category) async {
    return stylishProvider
        .fetchProductList(category.name)
        .then((value) => value.data
            .map((e) => Product(
                  id: e.id,
                  title: e.title,
                  image: e.images[0],
                  price: e.price,
                ))
            .toList());
  }
}
