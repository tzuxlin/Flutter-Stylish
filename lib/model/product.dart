class Product {
  final int id;
  final String title;
  final String image;
  final int price;

  Product({required this.id, required this.title, required this.image, required this.price});
}

class ProductCategory {
  final String name;
  final List<Product> products;

  ProductCategory({required this.name, required this.products});
}