import '../importer.dart';

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
