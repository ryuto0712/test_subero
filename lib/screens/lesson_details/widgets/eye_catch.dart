import 'package:flutter/material.dart';

class EyeCatch extends StatelessWidget {
  const EyeCatch(this.lessonIcon, {Key? key}) : super(key: key);
  final String lessonIcon;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 175,
      decoration: BoxDecoration(image: DecorationImage(fit: BoxFit.fitWidth, image: AssetImage(lessonIcon))),
    );
  }
}
