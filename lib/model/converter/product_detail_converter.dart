import 'dart:convert';

ProductDetailEntity productListFromJson(String str) => ProductDetailEntity.fromJson(json.decode(str));

String productListToJson(ProductDetailEntity data) => json.encode(data.toJson());

class ProductDetailEntity {
  ProductDetailEntity({
    required this.data,
  });

  Data data;

  factory ProductDetailEntity.fromJson(Map<String, dynamic> json) => ProductDetailEntity(
    data: Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "data": data.toJson(),
  };
}

class Data {
  Data({
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
  List<ColorEntity> colors;
  List<String> sizes;
  List<VariantEntity> variants;
  String mainImage;
  List<String> images;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
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
    colors: List<ColorEntity>.from(json["colors"].map((x) => ColorEntity.fromJson(x))),
    sizes: List<String>.from(json["sizes"].map((x) => x)),
    variants: List<VariantEntity>.from(json["variants"].map((x) => VariantEntity.fromJson(x))),
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

class ColorEntity {
  ColorEntity({
    required this.code,
    required this.name,
  });

  String code;
  String name;

  factory ColorEntity.fromJson(Map<String, dynamic> json) => ColorEntity(
    code: json["code"],
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "code": code,
    "name": name,
  };
}

class VariantEntity {
  VariantEntity({
    required this.colorCode,
    required this.size,
    required this.stock,
  });

  String colorCode;
  String size;
  int stock;

  factory VariantEntity.fromJson(Map<String, dynamic> json) => VariantEntity(
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
