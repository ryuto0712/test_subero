import 'package:flutter/material.dart';
import 'slide_show.dart';

class HomeBanner extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      child: SlideShow(),
    );
  }
}
