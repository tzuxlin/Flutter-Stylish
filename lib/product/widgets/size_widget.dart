import 'package:flutter/material.dart';

class SizesWidget extends StatelessWidget {
  const SizesWidget({
    super.key,
    required this.sizes,
    required this.onSizeChange,
  });

  final List<String> sizes;
  final Function(String) onSizeChange;

  @override
  Widget build(BuildContext context) {
    return Row(children: sizes.map((s) => getSizeWidget(s)).toList());
  }

  Widget getSizeWidget(String size) {
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
            size,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ));
  }
}
