import 'package:connie_stylish/model/product.dart';
import 'package:flutter/material.dart';

import 'home/home_product_large.dart';
import 'home/home_product_small.dart';
import 'home/hot_product.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Stylish',
      theme: ThemeData(
        brightness: Brightness.light,
        primaryColor: Colors.grey[200],
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<String> images = [
    'images/product_1.jpeg',
    'images/product_2.jpeg',
    'images/product_3.jpeg',
    'images/product_1.jpeg',
    'images/product_2.jpeg',
    'images/product_3.jpeg',
    'images/product_1.jpeg',
    'images/product_2.jpeg',
  ];

  final List<Product> products = [
    Product(title: 'ショートマウンテンパーカー', image: 'images/product_1.jpeg', price: 1960),
    Product(title: 'ボリュームショートライダース', image: 'images/product_2.jpeg', price: 1960),
    Product(title: 'シアーギャザーサンダル', image: 'images/product_3.jpeg', price: 1590),
    Product(title: 'ボリュームショートライダース', image: 'images/product_2.jpeg', price: 1960),
    Product(title: 'ショートマウンテンパーカー', image: 'images/product_1.jpeg', price: 1960),
  ];

  List<ProductCategory> get categories => [
    ProductCategory(name: "女裝", products: products),
    ProductCategory(name: "男裝", products: products),
    ProductCategory(name: "配件", products: products),
  ];

  @override
  Widget build(BuildContext context) {
    bool isLargeScreen = MediaQuery.of(context).size.width > 800;

    return Scaffold(
        appBar: const StylishAppBar(),
        body: Column(children: [
          HotProductList(isLargeScreen: isLargeScreen, imagePaths: images),
          Expanded(
              child: isLargeScreen
                  ? LargeHomeList(categories: categories)
                  : SmallHomeList(categories: categories)),
        ]));
  }
}

class StylishAppBar extends StatelessWidget implements PreferredSizeWidget {
  const StylishAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Theme.of(context).primaryColor,
      title: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Image.asset(
          'images/stylish.png',
          fit: BoxFit.fitHeight,
          height: preferredSize.height - 32,
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
