import 'package:flutter/material.dart';

import '../../model/model/product.dart';

class ColorsWidget extends StatelessWidget {
  const ColorsWidget({
    super.key,
    required this.colors,
  });

  final List<ColorModel> colors;

  @override
  Widget build(BuildContext context) {
    return Row(children: colors.map((c) => getColorWidget(c.color)).toList());
  }

  Widget getColorWidget(int color) {
    return Padding(
      padding: const EdgeInsets.all(4),
      child: Container(
        width: 36,
        height: 36,
        decoration: BoxDecoration(
          color: Color(color),
          borderRadius: BorderRadius.circular(4),
        ),
      ),
    );
  }
}