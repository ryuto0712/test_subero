import 'package:flutter/material.dart';
import 'package:subero_mobile/screens/index.dart';

class SearchButton extends StatelessWidget {
  SearchButton();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ElevatedButton(
        onPressed: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => Searched())),
        child: Text('検索'),
      ),
    );
  }
}
