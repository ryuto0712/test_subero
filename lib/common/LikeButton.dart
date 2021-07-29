import '../components/importer.dart';


class LikeButton extends StatefulWidget {
  LikeButton(this.iconSize);
  final double iconSize;

  @override
  _LikeButtonState createState() => _LikeButtonState();
}

class _LikeButtonState extends State<LikeButton> {
  bool _isLiked = false;
  final List<Color> colors = [
    Colors.red,
    Colors.grey,
  ];
  
  @override
  Widget build(BuildContext context) {
    return Container(
      child: IconButton(
        iconSize: widget.iconSize,
        color: colors[_isLiked?1:0],
        icon: Icon(Icons.favorite),
        onPressed: () => setState(()=> _isLiked = !_isLiked),
        // #todo: 状態管理
        // onPressed: () => Provider.of<_LikeButtonChangeNotifier>(context, listen:false).toggle(),
      )
    );
  }
}
