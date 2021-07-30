import '../../../importer.dart';

class LessonDescription extends StatelessWidget {
  final String description;
  LessonDescription(this.description);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20),
      child: Text(description),
    );
  }
}
