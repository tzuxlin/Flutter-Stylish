import 'package:flutter/material.dart';

import '../component/Shadow.dart';


class HotProductList extends StatelessWidget {
  const HotProductList(
      {super.key, required this.isLargeScreen, required this.imagePaths});

  final bool isLargeScreen;
  final List<String> imagePaths;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: isLargeScreen ? 250.0 : 150.0,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
        itemCount: imagePaths.length,
        itemBuilder: (BuildContext context, int index) {
          return TopItem(
            imagePath: imagePaths[index],
          );
        },
      ),
    );
  }
}

class TopItem extends StatelessWidget {
  const TopItem({
    super.key,
    required this.imagePath,
  });

  final String imagePath;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [boxShadow()],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Image.asset(
            imagePath,
            fit: BoxFit.fill,
          ),
        ),
      ),
    );
  }


}