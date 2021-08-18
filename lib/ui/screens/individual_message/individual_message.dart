import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'widgets/index.dart';

class IndividualMessage extends StatelessWidget {
  IndividualMessage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.grey),
        leading: IconButton(icon: Icon(Icons.arrow_back_ios), onPressed: Get.back),
        backgroundColor: Colors.transparent,
      ),
      extendBodyBehindAppBar: true,
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            LessonNameCard(),
            Image.asset('images/individual_message.png'),
          ],
        ),
      ),
    );
  }
}
