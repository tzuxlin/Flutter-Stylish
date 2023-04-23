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

  Future<ProductDetail> fetchProductDetail(int id) async {
    return stylishProvider
        .fetchProductDetail(id)
        .then((value) => value.data)
        .then((it) => ProductDetail(
              id: it.id,
              title: it.title,
              mainImage: it.mainImage,
              price: it.price,
              colors: it.colors.map((e) => ColorModel.fromEntity(e)).toList(),
              sizes: it.sizes,
              variants: it.variants.map((e) => Variant.fromEntity(e)).toList(),
              description: it.description,
              imageList: it.images,
            ));
  }
}
