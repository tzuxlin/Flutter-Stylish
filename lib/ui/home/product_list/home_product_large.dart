import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../model/model/product.dart';
import '../../component/product_item.dart';
import '../../component/progress.dart';
import '../../component/section_title.dart';
import 'home_product_list_cubit.dart';
import 'home_product_list_state.dart';

class LargeHomeList extends StatelessWidget {
  const LargeHomeList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeProductListCubit, DataCubitState>(
      builder: (context, state) {
        if (state is SuccessState) {
          return Row(children: buildCategoryWidgets(context.read<HomeProductListCubit>().productList));
        } else if (state is ErrorState) {
          return Text(state.message);
        } else {
          return const CenterProgress();
        }
      },
    );
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
