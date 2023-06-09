import 'package:connie_stylish/model/model/product.dart';
import 'package:connie_stylish/ui/map/map_sample.dart';
import 'package:connie_stylish/ui/product/product_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../model/repository/product_repository.dart';
import 'ar/ar.dart';
import 'home/hot_product.dart';
import 'home/product_list/home_product_list.dart';
import 'home/product_list/home_product_list_cubit.dart';

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
      initialRoute: '/home',
      routes: {
        '/home': (context) => const ARView(),
        '/product': (context) => const ProductPage(),
        '/map': (context) => const MapSample(),
      },
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    bool isLargeScreen = MediaQuery.of(context).size.width > 800;

    return Scaffold(
        appBar: const StylishAppBar(),
        body: Column(children: [
          HotProductList(isLargeScreen: isLargeScreen, products: products),
          BlocProvider(
            create: (BuildContext context) =>
                HomeProductListCubit(ProductRepository()),
            child: Builder(
                builder: (context) =>
                    HomeProductList(isLargeScreen: isLargeScreen)),
          ),
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
          'assets/images/stylish.png',
          fit: BoxFit.fitHeight,
          height: preferredSize.height - 32,
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

final List<Product> products = [
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
];