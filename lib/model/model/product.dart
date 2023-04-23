import 'package:connie_stylish/model/converter/product_detail_converter.dart';

class Product {
  final int id;
  final String title;
  final String image;
  final int price;

  Product({required this.id,
    required this.title,
    required this.image,
    required this.price});
}

class CategoryProduct {
  final String name;
  final List<Product> products;

  CategoryProduct({required this.name, required this.products});
}

class ProductDetail {
  final int id;
  final String title;
  final String mainImage;
  final int price;
  final List<ColorModel> colors;
  final List<String> sizes;
  final List<Variant> variants;
  final String description;
  final List<String> imageList;

  ProductDetail({
    required this.id,
    required this.title,
    required this.mainImage,
    required this.price,
    required this.colors,
    required this.sizes,
    required this.variants,
    required this.description,
    required this.imageList,
  });
}

class ColorModel {
  final String code;
  final String name;

  ColorModel({
    required this.code,
    required this.name,
  });

  factory ColorModel.fromEntity(ColorEntity entity) =>
      ColorModel(code: entity.code, name: entity.name);
}

class Variant {
  final String colorCode;
  final String size;
  final int stock;

  Variant({
    required this.colorCode,
    required this.size,
    required this.stock,
  });

  factory Variant.fromEntity(VariantEntity entity) =>
      Variant(colorCode: entity.colorCode, size: entity.size, stock: entity.stock);

}
