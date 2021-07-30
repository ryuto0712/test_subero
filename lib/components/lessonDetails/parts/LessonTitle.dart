import '../../../importer.dart';

class LessonTitle extends StatelessWidget {
  final String text;
  const LessonTitle(this.text, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(text),
    );
  }
}
