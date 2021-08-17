import 'package:flutter/material.dart';

class ClickableTagGenerator extends StatelessWidget {
  final List<dynamic> tags;
  ClickableTagGenerator(this.tags);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10.5),
      child: Wrap(
        children: <Widget>[
          for (int i = 0; i < tags.length; i++) clickableTag(tags.elementAt(i).toString()),
        ],
      ),
    );
  }

  Widget clickableTag(String tag) {
    return GestureDetector(
      onTap: () => {print("$tag was clicked")},
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 8, horizontal: 6),
        decoration: BoxDecoration(
          color: Colors.grey.shade200,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 2, horizontal: 17),
          child: Text(
            tag,
            style: TextStyle(fontSize: 10.5, color: Colors.grey.shade600),
          ),
        ),
      ),
    );
  }
}
