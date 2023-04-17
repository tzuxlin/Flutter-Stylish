import 'package:connie_stylish/home/product_list/home_product_list_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'home_product_large.dart';
import 'home_product_small.dart';

class HomeProductList extends StatelessWidget {
  const HomeProductList({
    super.key,
    required this.isLargeScreen,
    required this.homeProductListCubit,
  });

  final bool isLargeScreen;
  final HomeProductListCubit homeProductListCubit;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => homeProductListCubit,
      child: Builder(builder: (context) => _buildPage(context)),
    );
  }

  Widget _buildPage(BuildContext context) {
    return Expanded(
        child: isLargeScreen ? const LargeHomeList() : const SmallHomeList()
    );
  }
}