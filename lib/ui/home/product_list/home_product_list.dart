import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../model/model/product_category.dart';
import 'home_product_large.dart';
import 'home_product_list_cubit.dart';
import 'home_product_small.dart';

class HomeProductList extends StatefulWidget {
  const HomeProductList({
    super.key,
    required this.isLargeScreen,
  });

  final bool isLargeScreen;

  @override
  State<HomeProductList> createState() => _HomeProductListState();
}

class _HomeProductListState extends State<HomeProductList> {
  @override
  void initState() {
    super.initState();
    context.read<HomeProductListCubit>().fetch(ProductCategory.values);
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: widget.isLargeScreen
            ? const LargeHomeList()
            : const SmallHomeList());
  }
}