import 'package:flutter/material.dart';

class NetworkCircleImage extends StatelessWidget {
  NetworkCircleImage(
      this.size,
      {this.alt = "",
      this.width = 0,
      this.color = Colors.black,
      this.imageUrl = "none"});
  final String alt;
  final String imageUrl;
  final double size;
  final double width;
  final Color color;
  imageRoot(alt, [url]) {
    if (url != "none") {
      return NetworkImage(url);
    } else {
      return AssetImage(alt);
    }
  }

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
              image: imageRoot(alt,imageUrl),
            ),
            border: Border.all(width: width, color: color)),
      ),
    );
  }
}

