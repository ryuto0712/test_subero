import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:subero_mobile/ui/widgets/index.dart';

class MyPageIcon extends StatefulWidget {
  final String video;
  MyPageIcon(this.video);

  @override
  _MyPageIconState createState() => _MyPageIconState();
}

class _MyPageIconState extends State<MyPageIcon> {
  static const double size = 100;

  List<Widget> iconBackground = [
    Container(
        width: size + 7,
        height: size + 7,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.grey,
        )),
    CircleImage('images/raimbow.jpg', size + 7),
  ];

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () => Get.to(MoviePlayer(widget.video)),
        child: Container(
          height: 120,
          child: Stack(
            children: [
              iconBackground[1],
              CircleImage('images/app_icon2.png', size),
            ],
          ),
        ));
  }
}
