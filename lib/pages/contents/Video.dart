import '../../components/importer.dart';

class VideoPage extends StatelessWidget{
  String video;
  VideoPage(this.video);

  @override
  Widget build(BuildContext context){
    return Video(video);
  }
}
