import 'package:flutter/material.dart';

import '../../../model/model/product.dart';

class ColorsWidget extends StatelessWidget {
  const ColorsWidget({
    super.key,
    required this.colors,
  });

  final List<ColorModel> colors;

  @override
  Widget build(BuildContext context) {
    return Row(children: colors.map((c) => getColorWidget(c.code)).toList());
  }

  Widget getColorWidget(String color) {
    return Padding(
      padding: const EdgeInsets.all(4),
      child: Container(
        width: 36,
        height: 36,
        decoration: BoxDecoration(
          color: colorFromCode(color),
          borderRadius: BorderRadius.circular(4),
        ),
      ),
    );
  }

  Color colorFromCode(String code) {
    if (code.startsWith('#')) {
      code = code.substring(1);
    }

    if (code.length == 6) {
      code = 'FF$code';
    }

    final value = int.parse(code, radix: 16);

    return Color(value);
  }
}