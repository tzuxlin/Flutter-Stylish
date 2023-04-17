import 'package:connie_stylish/home/product_list/home_product_list_cubit.dart';
import 'package:connie_stylish/home/product_list/home_product_list_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../component/product_item.dart';
import '../../component/progress.dart';
import '../../component/section_title.dart';
import '../../model/model/product.dart';
import '../../model/model/product_category.dart';

class SmallHomeList extends StatelessWidget {
  const SmallHomeList({
    super.key,
    required this.categories,
  });

  final List<ProductCategory> categories;

  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<HomeProductListCubit>(context);
    final state = cubit.state;

    if (state is SuccessState) {
      return ListView(children: buildCategoryPages(cubit.productList));
    } else if (state is ErrorState) {
      return Text(state.message);
    } else {
      return const CenterProgress();
    }
  }

  List<Widget> buildCategoryPages(List<CategoryProduct> categories) {
    return categories
        .map((category) => SmallHomeProductList(
            title: category.name, products: category.products))
        .toList();
  }
}

class SmallHomeProductList extends StatefulWidget {
  const SmallHomeProductList({
    super.key,
    required this.title,
    required this.products,
  });

  final String title;
  final List<Product> products;

  @override
  State<SmallHomeProductList> createState() => _SmallHomeProductListState();
}

class _SmallHomeProductListState extends State<SmallHomeProductList>
    with AutomaticKeepAliveClientMixin {
  bool _needExpand = true;

  void _handleTap() {
    setState(() {
      _needExpand = !_needExpand;
    });
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return SingleChildScrollView(
      child: LayoutBuilder(builder: (context, BoxConstraints boxConstraints) {
        return Column(children: [
          GestureDetector(
            onTap: _handleTap,
            child: SectionTitle(
              title: "${_needExpand ? "－" : "＋"}   ${widget.title}",
              width: boxConstraints.maxWidth,
            ),
          ),
          if (_needExpand) ProductItemList(products: widget.products),
        ]);
      }),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
