import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:subero_mobile/ui/screens/index.dart';
import 'package:subero_mobile/ui/widgets/index.dart';

class MyPageIcon extends StatelessWidget {
  final String video;
  final String? iconUrl;
  MyPageIcon(this.video,[this.iconUrl]);

  static const double size = 100;


  List<Widget> iconBackground = [
    Container(
        width: size + 7,
        height: size + 7,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.grey,
        )),
    CircleImage('images/raimbow.jpg', size +7),
  ];
  @override

  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.to(Video()),
      child: Container(
        height: 120,
        child: Stack(
          children: [
            iconBackground[1],
            NetworkCircleImage(size,alt:'images/app_icon2.png',imageUrl:iconUrl??"none"),
          ],
        ),
      ),
    );
  }
}
