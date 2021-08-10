import 'package:flutter/material.dart';

class ClickableTagGenerator extends StatelessWidget {
  final List<String> tagNames;
  ClickableTagGenerator(this.tagNames);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10.5),
      child: Row(
        children: <Widget>[
          for (int i = 0; i < tagNames.length; i++) clickableTag(tagNames.elementAt(i)),
        ],
      ),
    );
  }

  Widget clickableTag(String tagName) {
    return GestureDetector(
      onTap: () => {print("$tagName was clicked")},
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 8, horizontal: 6),
        decoration: BoxDecoration(
          color: Colors.grey.shade200,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 2, horizontal: 17),
          child: Text(
            tagName,
            style: TextStyle(fontSize: 10.5, color: Colors.grey.shade600),
          ),
        ),
      ),
    );
  }
}
