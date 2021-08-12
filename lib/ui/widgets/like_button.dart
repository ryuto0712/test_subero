import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:subero_mobile/controller/like_button/like_button_controller.dart';

class LikeButton extends StatelessWidget {
  LikeButton(this.iconSize);
  final double iconSize;

  final LikeButtonController c = Get.put(LikeButtonController());
  final List<Color> colors = [
    Colors.red,
    Colors.grey,
  ];

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => IconButton(
        iconSize: iconSize,
        color: colors[c.isLiked.value ? 1 : 0],
        icon: Icon(Icons.favorite),
        onPressed: () => c.toggle(),
      ),
    );
  }
}
