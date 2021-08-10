import 'package:flutter/material.dart';

class CircleImage extends StatelessWidget {
  CircleImage(this.image, this.size, {this.width = 0, this.color = Colors.black});
  final String image;
  final double size;
  final double width;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
            image: DecorationImage(
              fit: BoxFit.fill,
              image: AssetImage(image),
            ),
            border: Border.all(width: width, color: color)),
      ),
    );
  }
}
