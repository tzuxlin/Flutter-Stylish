import 'dart:convert';

ProductList productListFromJson(String str) => ProductList.fromJson(json.decode(str));

String productListToJson(ProductList data) => json.encode(data.toJson());

class ProductList {
  ProductList({
    required this.data,
    this.nextPaging,
  });

  List<Datum> data;
  int? nextPaging;

  factory ProductList.fromJson(Map<String, dynamic> json) => ProductList(
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    nextPaging: json["next_paging"],
  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
    "next_paging": nextPaging,
  };
}

class Datum {
  Datum({
    required this.id,
    required this.category,
    required this.title,
    required this.description,
    required this.price,
    required this.texture,
    required this.wash,
    required this.place,
    required this.note,
    required this.story,
    required this.colors,
    required this.sizes,
    required this.variants,
    required this.mainImage,
    required this.images,
  });

  int id;
  String category;
  String title;
  String description;
  int price;
  String texture;
  String wash;
  String place;
  String note;
  String story;
  List<Color> colors;
  List<String> sizes;
  List<Variant> variants;
  String mainImage;
  List<String> images;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    category: json["category"],
    title: json["title"],
    description: json["description"],
    price: json["price"],
    texture: json["texture"],
    wash: json["wash"],
    place: json["place"],
    note: json["note"],
    story: json["story"],
    colors: List<Color>.from(json["colors"].map((x) => Color.fromJson(x))),
    sizes: List<String>.from(json["sizes"].map((x) => x)),
    variants: List<Variant>.from(json["variants"].map((x) => Variant.fromJson(x))),
    mainImage: json["main_image"],
    images: List<String>.from(json["images"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "category": category,
    "title": title,
    "description": description,
    "price": price,
    "texture": texture,
    "wash": wash,
    "place": place,
    "note": note,
    "story": story,
    "colors": List<dynamic>.from(colors.map((x) => x.toJson())),
    "sizes": List<dynamic>.from(sizes.map((x) => x)),
    "variants": List<dynamic>.from(variants.map((x) => x.toJson())),
    "main_image": mainImage,
    "images": List<dynamic>.from(images.map((x) => x)),
  };
}

class Color {
  Color({
    required this.code,
    required this.name,
  });

  String code;
  String name;

  factory Color.fromJson(Map<String, dynamic> json) => Color(
    code: json["code"],
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "code": code,
    "name": name,
  };
}

class Variant {
  Variant({
    required this.colorCode,
    required this.size,
    required this.stock,
  });

  String colorCode;
  String size;
  int stock;

  factory Variant.fromJson(Map<String, dynamic> json) => Variant(
    colorCode: json["color_code"],
    size: json["size"],
    stock: json["stock"],
  );

  Map<String, dynamic> toJson() => {
    "color_code": colorCode,
    "size": size,
    "stock": stock,
  };
}
