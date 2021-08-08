import 'package:flutter/material.dart';
import 'package:subero_mobile/widgets/index.dart';

class Video extends StatefulWidget {
  String video;
  Video(this.video);

  @override
  _VideoState createState() => _VideoState();
}

class _VideoState extends State<Video> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      child: MoviePlayer(widget.video),
    );
  }
}
