import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[200],
      body: ListView(
        children: [
          _menuItem("Event1", Icon(Icons.settings)),
          _menuItem("Event2", Icon(Icons.map)),
          _menuItem("Event3", Icon(Icons.room)),
          _menuItem("Event4", Icon(Icons.local_shipping)),
          _menuItem("Event5", Icon(Icons.airplanemode_active)),
        ]
      ),
    );
  }
  Widget _menuItem(String title, Icon icon) {
    return Container(
      decoration: new BoxDecoration(
        border: new Border(bottom: BorderSide(width: 1.0, color: Colors.grey))
      ),
      child:ListTile(
        leading: icon,
        title: Text(
          title,
          style: TextStyle(
            color:Colors.black,
            fontSize: 18.0
          ),
        ),
        onTap: () {
          print("onTap called.");
        }, // タップ
        onLongPress: () {
          print("onLongPress called.");
        }, // 長押し
      ),
    );
  }
}
