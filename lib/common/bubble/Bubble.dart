import '../../importer.dart';
import 'BubbleBorder.dart';

class Bubble extends StatelessWidget {
  final String text;

  Bubble(this.text);

  @override
  Widget build(BuildContext context) {
    return Container(
        // height: 100,
        // padding: EdgeInsets.all(16),
        decoration: ShapeDecoration(
          color: Colors.white,
          shadows: [
            const BoxShadow(
              color: Colors.grey,
              offset: Offset(-1, 3),
              blurRadius: 2,
            )
          ],
          shape: BubbleBorder(),
        ),
        child: Container(
          margin: EdgeInsets.fromLTRB(15, 10, 15, 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(text),
            ],
          ),
        ));
  }
}
