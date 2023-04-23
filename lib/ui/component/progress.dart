import 'package:flutter/material.dart';

class CenterProgress extends StatelessWidget {
  const CenterProgress({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Center(child: CircularProgressIndicator(color: Colors.black));
  }
}