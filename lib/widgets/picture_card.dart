import 'dart:io';
import 'package:flutter/material.dart';

class PictureCard extends StatelessWidget {
  final String imagePath;
  final VoidCallback onTap;

  const PictureCard({Key? key, this.imagePath = "", required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 180,
        height: 150,
        decoration: BoxDecoration(
            color: Colors.amber, borderRadius: BorderRadius.circular(5)),
        child: imagePath.isEmpty
            ? null
            : ClipRRect(
                borderRadius: BorderRadius.circular(5),
                child: Image.file(
                  File(imagePath),
                  fit: BoxFit.cover,
                ),
              ),
      ),
    );
  }
}
