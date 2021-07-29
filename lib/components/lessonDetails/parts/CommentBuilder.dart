import '../../importer.dart';
import 'Comment.dart';

class CommentBuilder extends StatelessWidget {
  final List<String> comments;
  final List<String> users;
  final List<String> icons;

  CommentBuilder(this.comments, this.users, this.icons);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          for (int i=0; i < comments.length; i++)
            Comment(comments[i], users[i], icons[i])
        ],
      )
    );
  }
}
