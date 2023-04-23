import 'package:connie_stylish/ui/main.dart';
import 'package:connie_stylish/model/model/product.dart';
import 'package:connie_stylish/model/repository/product_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../component/progress.dart';
import '../home/product_list/home_product_list_state.dart';
import 'product_detail_cubit.dart';
import 'widgets/attribute.dart';
import 'widgets/color_widget.dart';
import 'widgets/quantity_widget.dart';
import 'widgets/size_widget.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({super.key});

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {

  @override
  Widget build(BuildContext context) {
    bool isLargeScreen = MediaQuery.of(context).size.width > 800;

    return BlocProvider(
      create: (context) => ProductDetailCubit(ProductRepository()),
      child: ProductDetailScreen(isLargeScreen: isLargeScreen),
    );
  }
}

class ProductDetailScreen extends StatefulWidget {
  const ProductDetailScreen({
    super.key,
    required this.isLargeScreen,
  });

  final bool isLargeScreen;

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  @override
  void initState() {
    super.initState();
    // final Map arguments = ModalRoute.of(context)?.settings.arguments as Map;
    context.read<ProductDetailCubit>().fetch(201807201824);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const StylishAppBar(),
      body: widget.isLargeScreen ? LargeScreenProduct() : SmallScreenProduct(),
      backgroundColor: Colors.white,
    );
  }
}

class LargeScreenProduct extends StatelessWidget {
  const LargeScreenProduct({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductDetailCubit, DataCubitState>(
      builder: (context, state) {
        if (state is SuccessState) {
          final product = context.read<ProductDetailCubit>().product;
          return Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.network(product.mainImage),
              Padding(
                padding: const EdgeInsets.all(32),
                child: ProductInfo(product: product),
              ),
            ],
          );
        } else if (state is ErrorState) {
          return Text(state.message);
        } else {
          return const CenterProgress();
        }
      },
    );
  }
}

class SmallScreenProduct extends StatelessWidget {
  const SmallScreenProduct({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductDetailCubit, DataCubitState>(
      builder: (context, state) {
        if (state is SuccessState) {
          final product = context.read<ProductDetailCubit>().product;
          return ListView(
            padding: const EdgeInsets.symmetric(horizontal: 90),
            children: [
              Image.network(product.mainImage),
              ProductInfo(product: product),
              const SizedBox(height: 300),
            ],
          );
        } else if (state is ErrorState) {
          return Text(state.message);
        } else {
          return const CenterProgress();
        }
      },
    );
  }
}

class ProductInfo extends StatefulWidget {
  const ProductInfo({
    super.key,
    required this.product,
  });

  final ProductDetail product;

  @override
  State<ProductInfo> createState() => _ProductInfoState();
}

class _ProductInfoState extends State<ProductInfo> {
  late String _selectedSize;

  @override
  void initState() {
    super.initState();
    _selectedSize = widget.product.sizes.first;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 16),
        Text(
          widget.product.title,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
          maxLines: 2,
        ),
        const SizedBox(height: 16),
        Text(
          '\$ ${widget.product.price}',
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
        const SizedBox(height: 48),
        Attribute(
            title: '顏色', widget: ColorsWidget(colors: widget.product.colors)),
        Attribute(
            title: '尺寸',
            widget: SizesWidget(
              sizes: widget.product.sizes,
              onSizeChange: (s) {
                onSizeChanged(s);
              },
            )),
        Attribute(
            title: '數量',
            widget: QuantitySelector(variant: getSelectedVariant(_selectedSize))
        )
      ],
    );
  }

  Variant getSelectedVariant(String selectedSize) {
    return widget.product.variants.firstWhere((element) => element.size == selectedSize);
  }

  void onSizeChanged(String size) {
    setState(() {
      _selectedSize = size;
    });
  }
}
