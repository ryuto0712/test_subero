import '../components/importer.dart';

class SampleIcons extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Row(
      children: [
        icon(),
        icon(),
        icon(),
        icon(),
        icon(),
      ],
    );
  }

  Widget icon(){
    return Column(
      children: [
        Container(child: Image.asset('images/icon_sample.png'), height: 30, width: 30),
        Text('初心者向け'),
      ],
    );
  }
}
