import 'package:connie_stylish/home/product_list/home_product_list_cubit.dart';
import 'package:connie_stylish/home/product_list/home_product_list_state.dart';
import 'package:connie_stylish/model/model/product_category.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../component/product_item.dart';
import '../../component/progress.dart';
import '../../component/section_title.dart';
import '../../model/model/product.dart';

class LargeHomeList extends StatelessWidget {
  const LargeHomeList({
    super.key,
    required this.categories,
  });

  final List<ProductCategory> categories;

  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<HomeProductListCubit>(context);
    cubit.fetch(categories);

    if (cubit.state is SuccessState) {
      return Row(children: buildCategoryWidgets(cubit.productList));
    } else if (cubit.state is LoadingState) {
      return const CenterProgress();
    } else {
      return const Text('Error');
    }
  }

  List<Widget> buildCategoryWidgets(List<CategoryProduct> categories) {
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