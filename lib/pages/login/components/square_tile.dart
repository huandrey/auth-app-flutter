import 'package:flutter/material.dart';

class SquareTile extends StatelessWidget {
  final String imagePath;
  final double? width;
  final double? height;

  const SquareTile({
    super.key,
    required this.imagePath,
    this.width = 62,
    this.height = 62,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        color: Colors.grey.shade200,
      ),
      child: Image.asset(
        imagePath,
        width: width,
        height: height,
      ),
    );
  }
}
