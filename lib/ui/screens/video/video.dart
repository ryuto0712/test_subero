import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:subero_mobile/ui/widgets/index.dart';

class Video extends StatelessWidget {
  final String videoUrl;
  Video(this.videoUrl);

  @override
  Widget build(BuildContext context) {
    print('video now and the url is $videoUrl');
    return Stack(
      children: <Widget>[
        // new Container(
        //   height: double.infinity,
        //   width: double.infinity,
        //   decoration: new BoxDecoration(
        //     image: new DecorationImage(
        //       image: new AssetImage(videoUrl),
        //       fit: BoxFit.cover,
        //     ),
        //   ),
        // ),
        Container(
          color: Colors.black,
          child: MoviePlayer(videoUrl),
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: new AppBar(
            title: const Text("Standard AppBar"),
            iconTheme: IconThemeData(
              color: Colors.grey, //change your color here
            ),
            leading: IconButton(icon: Icon(Icons.arrow_back_ios), onPressed: () => Get.back()),
            backgroundColor: Colors.transparent,
            elevation: 0.0,
          ),
          body: new Container(
            color: Colors.transparent,
          ),
        ),
      ],
    );

    // return Stack(
    //   children: <Widget>[
    //
    //     // Scaffold(
    //     //   appBar: AppBar(
    //     //     backgroundColor: Colors.transparent,
    //     //     elevation: 0.0,
    //     //   ),
    //     //   body: Container(color: Colors.transparent),
    //     // ),
    //   ],
    // );
  }
}
