import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:subero_mobile/ui/screens/index.dart';

class SearchButton extends StatelessWidget {
  SearchButton();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ElevatedButton(
        onPressed: () => Get.to(Searched(), id: 1),
        child: Text('検索'),
      ),
    );
  }
}
