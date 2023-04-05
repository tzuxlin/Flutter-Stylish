import 'package:flutter/material.dart';

class ProductWrapper extends StatelessWidget {
  const ProductWrapper(
      {super.key, required this.child, required this.productId});

  final Widget child;
  final int productId;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          Navigator.pushNamed(
            context,
            '/product',
            arguments: {'product_id': productId},
          );
        },
        child: child);
  }
}
