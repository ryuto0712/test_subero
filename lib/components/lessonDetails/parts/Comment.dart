import '../../../importer.dart';

class Comment extends StatelessWidget {
  Comment(this.comment, this.userName, this.icon);
  final String comment;
  final String userName;
  final String icon;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 7),
        child: Row(children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: Colors.grey, width: 1),
              image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage(icon),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.only(left: 12, bottom: 2),
                  child: Text(userName, style: TextStyle(color: Colors.grey.shade600, fontSize: 12)),
                ),
                Container(
                    // padding: EdgeInsets.all(10),
                    // color: Colors.grey.shade400,
                    child: Bubble(comment))
              ],
            ),
          )
        ]));
  }
}
