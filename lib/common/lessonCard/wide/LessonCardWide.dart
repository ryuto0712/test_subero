import '../../../components/importer.dart';

class LessonCardWide extends StatelessWidget {
  final String lessonIcon;
  final String hostIcon;
  final String lessonName;
  final String hostName;
  final double width;

  LessonCardWide(this.lessonName, this.hostName, this.lessonIcon, this.hostIcon, this.width);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => LessonDetails())),
      child: Container(
        width: width,
        height: 200,
        child: Card(
          margin: const EdgeInsets.all(5),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
          clipBehavior: Clip.antiAliasWithSaveLayer, // カードの角丸
          child: Container(
            width: 120,
            height: 140,
            child: Column(
              children: [
                Container(
                  height: 130,
                  margin: EdgeInsets.only(bottom: 3),
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(width: 1, color: Colors.grey.shade300),
                    ),
                    image: DecorationImage(
                      fit: BoxFit.fitWidth,
                      image: AssetImage(lessonIcon),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 5),
                  child: Text(lessonName, style: TextStyle(fontSize: 11)),
                ),
                Container(
                  margin: EdgeInsets.only(left: 5),
                  child: GestureDetector(
                    onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => UserPagePage())),
                    child: Row(
                      children: [
                        Container(margin: EdgeInsets.only(right: 5), child: CircleImage(hostIcon, 15, width: 1, color: Colors.grey.shade500), width: 15, height: 15),
                        Text(hostName, style: TextStyle(fontSize: 9))
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
