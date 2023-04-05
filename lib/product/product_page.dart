import 'package:connie_stylish/main.dart';
import 'package:connie_stylish/model/product.dart';
import 'package:connie_stylish/product/widgets/attribute.dart';
import 'package:connie_stylish/product/widgets/color_widget.dart';
import 'package:connie_stylish/product/widgets/quantity_widget.dart';
import 'package:connie_stylish/product/widgets/size_widget.dart';
import 'package:flutter/material.dart';

class ProductPage extends StatelessWidget {
  const ProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    final Map arguments = ModalRoute.of(context)?.settings.arguments as Map;
    final productId = arguments['product_id'];
    final product = fetchProduct(productId);

    return Scaffold(
      appBar: const StylishAppBar(),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 90),
        children: [
          SmallScreenProduct(product: product),
        ],
      ),
      backgroundColor: Colors.white,
    );
  }

  ProductDetail fetchProduct(int id) {
    final product = products.firstWhere((element) => element.id == id);
    final colors = [
      ColorModel(color: 0xFF5A6396),
      ColorModel(color: 0xFF91B88C),
      ColorModel(color: 0xFFD9D3A5),
      ColorModel(color: 0xFFA67488),
    ];
    final sizes = [
      SizeModel(size: 'S', quantity: 3),
      SizeModel(size: 'M', quantity: 5),
      SizeModel(size: 'L', quantity: 0),
    ];

    return ProductDetail(
      id: id,
      title: product.title,
      image: product.image,
      price: product.price,
      colors: colors,
      sizes: sizes,
      description: "",
      imageList: [product.image],
    );
  }
}

class SmallScreenProduct extends StatefulWidget {
  const SmallScreenProduct({
    super.key,
    required this.product,
  });

  final ProductDetail product;

  @override
  State<SmallScreenProduct> createState() => _SmallScreenProductState();
}

class _SmallScreenProductState extends State<SmallScreenProduct> {

  late SizeModel _selectedSize;

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
          Image.asset(widget.product.image),
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
              widget: QuantitySelector(size: _selectedSize))
        ],
    );
  }

  void onSizeChanged(SizeModel size) {
    setState(() {
      _selectedSize = size;
    });
  }

}
