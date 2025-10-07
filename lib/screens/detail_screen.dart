import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget {
  // Solo debe tener 'imagePath' y 'heroTag'
  final String imagePath;
  final String heroTag;

  const DetailScreen({
    super.key,
    required this.imagePath,
    required this.heroTag,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child: Center(
          child: Hero(
            tag: heroTag,
            child: Image.asset(
              imagePath,
            ),
          ),
        ),
      ),
    );
  }
}