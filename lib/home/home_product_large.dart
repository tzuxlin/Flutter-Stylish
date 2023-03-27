import 'package:flutter/material.dart';

import '../component/product_item.dart';
import '../component/section_title.dart';
import '../model/product.dart';

class LargeHomeList extends StatelessWidget {
  const LargeHomeList({
    super.key,
    required this.categories,
  });

  final List<ProductCategory> categories;

  @override
  Widget build(BuildContext context) {
    return Row(children: buildCategoryWidgets(categories));
  }

  List<Widget> buildCategoryWidgets(List<ProductCategory> categories) {
    return categories
        .map((category) => Expanded(
            child: LargeHomeProductList(
                title: category.name, products: category.products)))
        .toList();
  }
}

class LargeHomeProductList extends StatelessWidget {
  const LargeHomeProductList(
      {super.key, required this.title, required this.products});

  final String title;
  final List<Product> products;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, BoxConstraints boxConstraints) {
      return Column(
        children: [
          SectionTitle(
            title: title,
            width: boxConstraints.maxWidth,
          ),
          Expanded(child: ProductItemList(products: products)),
        ],
      );
    });
  }
}