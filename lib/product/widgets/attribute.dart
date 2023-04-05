import 'package:flutter/material.dart';

class Attribute extends StatelessWidget {
  const Attribute({
    super.key,
    required this.title,
    required this.widget,
  });

  final String title;
  final Widget widget;

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Text('$title ・ ', style: const TextStyle(letterSpacing: 2)),
      widget,
    ]);
  }
}
