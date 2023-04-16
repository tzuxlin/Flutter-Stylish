import 'package:connie_stylish/product/product_wrapper.dart';
import 'package:flutter/material.dart';

import '../component/Shadow.dart';
import '../model/model/product.dart';

class HotProductList extends StatelessWidget {
  const HotProductList(
      {super.key, required this.isLargeScreen, required this.products});

  final bool isLargeScreen;
  final List<Product> products;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: isLargeScreen ? 250.0 : 150.0,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
        itemCount: products.length,
        itemBuilder: (BuildContext context, int index) {
          return TopItem(
            productId: products[index].id,
            imagePath: products[index].image,
          );
        },
      ),
    );
  }
}

class TopItem extends StatelessWidget {
  const TopItem({
    super.key,
    required this.productId,
    required this.imagePath,
  });

  final int productId;
  final String imagePath;

  @override
  Widget build(BuildContext context) {
    return ProductWrapper(
      productId: productId,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [boxShadow()],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset(
              imagePath,
              fit: BoxFit.fill,
            ),
          ),
        ),
      ),
    );
  }
}
