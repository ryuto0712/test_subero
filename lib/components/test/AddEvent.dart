import 'package:flutter/material.dart';

class AddEvent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade50,
      body: Center(
        child: Text(
          "Add Event Page",
          style: TextStyle(
            fontSize: 20
          ),
        ),
      ),
    );
  }
}
