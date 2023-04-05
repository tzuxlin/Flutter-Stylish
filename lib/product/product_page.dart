import 'package:flutter/material.dart';

class ProductPage extends StatelessWidget {
  const ProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    final Map arguments = ModalRoute.of(context)?.settings.arguments as Map;
    final productId = arguments['product_id'];

    return Scaffold(
      body: Text('Parameter from Widget A: $productId'),
    );
  }
}
