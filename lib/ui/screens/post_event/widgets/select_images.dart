import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SelectImages extends StatelessWidget {
  final List<String> imageUrls = ['', '', ''];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          for (int i = 0; i < 3; i++)
            Container(
              height: 80,
              width: 80,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey.shade400),
                borderRadius: BorderRadius.circular(10),

                // image: DecorationImage(
                //   image: AssetImage(imageUrls[i] == '' ? 'images/app_icon.png' : imageUrls[i]),
                // ),
              ),
              child: imageUrls[i] == '' ? Icon(Icons.add_a_photo) : Image.asset(imageUrls[i]),
            ),
          GestureDetector(
            onTap: () => {},
            child: Icon(Icons.add),
          ),
        ],
      ),
    );
  }
}
