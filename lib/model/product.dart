class Product {
  final int id;
  final String title;
  final String image;
  final int price;

  Product(
      {required this.id,
      required this.title,
      required this.image,
      required this.price});
}

class ProductCategory {
  final String name;
  final List<Product> products;

  ProductCategory({required this.name, required this.products});
}

class ProductDetail {
  final int id;
  final String title;
  final String image;
  final int price;
  final List<ColorModel> colors;
  final List<SizeModel> sizes;
  final String description;
  final List<String> imageList;

  ProductDetail({
    required this.id,
    required this.title,
    required this.image,
    required this.price,
    required this.colors,
    required this.sizes,
    required this.description,
    required this.imageList,
  });
}

class ColorModel {
  final int color;

  ColorModel({required this.color});
}

class SizeModel {
  final String size;
  final int quantity;

  SizeModel({required this.size, required this.quantity});
}
