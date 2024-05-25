import 'package:flutter/material.dart';

class SquareTile extends StatelessWidget {
  final String imagePath;
  final Function()? onTap;
  final double? width;
  final double? height;

  SquareTile({
    super.key,
    required this.imagePath,
    this.onTap,
    this.width = 62,
    this.height = 62,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
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
      ),
    );
  }
}
