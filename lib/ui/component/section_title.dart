import 'package:flutter/material.dart';

import 'Shadow.dart';
import 'consts.dart';


class SectionTitle extends StatelessWidget {
  const SectionTitle({
    super.key,
    required this.title,
    required this.width,
  });

  final String title;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      margin: itemEdgeInsets,
      padding: itemEdgeInsets,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        boxShadow: [boxShadow()],
        color: Theme.of(context).primaryIconTheme.color,
      ),
      child: Text(
        title,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 16,
          fontWeight: FontWeight.bold,
          letterSpacing: 2,
        ),
      ),
    );
  }
}
