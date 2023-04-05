import 'package:flutter/material.dart';

import '../../model/product.dart';

class SizesWidget extends StatelessWidget {
  const SizesWidget({
    super.key,
    required this.sizes,
    required this.onSizeChange,
  });

  final List<SizeModel> sizes;
  final Function(SizeModel) onSizeChange;

  @override
  Widget build(BuildContext context) {
    return Row(children: sizes.map((s) => getSizeWidget(s)).toList());
  }

  Widget getSizeWidget(SizeModel size) {
    return Padding(
        padding: const EdgeInsets.all(4),
        child: TextButton(
          onPressed: () {
            onSizeChange(size);
          },
          style: ButtonStyle(
            foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
            overlayColor: MaterialStateProperty.all<Color>(Colors.black12),
          ),
          child: Text(
            size.size,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ));
  }
}
