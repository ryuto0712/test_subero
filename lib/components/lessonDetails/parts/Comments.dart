import '../../importer.dart';
import 'CommentBuilder.dart';

class Comments extends StatelessWidget {
  final List<String> comments;
  final List<String> users;
  final List<String> icons;
  Comments(this.comments, this.users, this.icons);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.only(left: 50),
            margin: EdgeInsets.only(bottom: 5),
            child: Text(
              'コメント',
              style: TextStyle(
                fontSize: 13
              )
            ),
          ),
          CommentBuilder(comments, users, icons),
        ],
      )
    );
  }
}
