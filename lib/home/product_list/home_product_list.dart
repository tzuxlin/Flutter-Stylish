import 'package:connie_stylish/home/product_list/home_product_list_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../model/model/product_category.dart';
import '../../model/repository/ProductRepository.dart';
import 'home_product_large.dart';
import 'home_product_small.dart';

class HomeProductList extends StatelessWidget {
  const HomeProductList({
    super.key,
    required this.isLargeScreen,
  });

  final bool isLargeScreen;

  @override
  Widget build(BuildContext context) {
    final cubit = HomeProductListCubit(ProductRepository());
    cubit.fetch(ProductCategory.values);

    return BlocProvider(
      create: (BuildContext context) => cubit,
      child: Builder(builder: (context) => _buildPage(context)),
    );
  }

  Widget _buildPage(BuildContext context) {
    return Expanded(
        child: isLargeScreen
            ? const LargeHomeList(categories: ProductCategory.values)
            : const SmallHomeList(categories: ProductCategory.values));
  }
}