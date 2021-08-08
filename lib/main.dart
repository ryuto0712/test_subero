import 'importer.dart';
import 'package:flutter/rendering.dart';

void main() {
  // debugPaintSizeEnabled = true; // widgetのレンダリングチェック
  runApp(MyApp());
}


//videoのやつ
// import 'dart:async';
// import 'package:video_player/video_player.dart';
// import 'package:flutter/material.dart';

// void main() => runApp(VideoApp());

// class VideoApp extends StatefulWidget {
//   @override
//   _VideoAppState createState() => _VideoAppState();
// }

// class _VideoAppState extends State<VideoApp> {
//   late VideoPlayerController _controller;

//   @override
//   void initState() {
//     super.initState();
    // _controller = VideoPlayerController.asset(
    //   'sample_video.mp4',
//     _controller = VideoPlayerController.network(
//         'https://sample-videos.com/video123/mp4/720/big_buck_bunny_720p_20mb.mp4')
//       ..initialize().then((_) {
//         // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
//         setState(() {});
//       });
//     // _controller = VideoPlayerController.asset('sample_video.mp4')
//     //   ..initialize().then((_) {
//     //     // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
//     //     setState(() {});
//     //   });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Video Demo',
//       home: Scaffold(
//         body: Center(
//           child: _controller.value.isInitialized
//               ? AspectRatio(
//                   aspectRatio: _controller.value.aspectRatio,
//                   child: VideoPlayer(_controller),
//                 )
//               : Container(),
//         ),
//         floatingActionButton: FloatingActionButton(
//           onPressed: () {
//             setState(() {
//               _controller.value.isPlaying
//                   ? _controller.pause()
//                   : _controller.play();
//             });
//           },
//           child: Icon(
//             _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
//           ),
//         ),
//       ),
//     );
//   }

//   @override
//   void dispose() {
//     super.dispose();
//     _controller.dispose();
//   }
// }





// 状態管理のやつ

// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

// class MyApp6 extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     print('MyApp6 is built');
//     return HogeWidget();
//   }
// }

// class HogeWidget extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     // ここからChangeNotifierを下層に渡す
//     return ChangeNotifierProvider<_HogeChangeNotifier>(
//       create: (context) => _HogeChangeNotifier(),
//       child: Column(
//         children: <Widget>[
//           WidgetA(),
//           WidgetB(),
//         ],
//       ),
//     );
//   }
// }

// class _HogeChangeNotifier extends ChangeNotifier {
//   int _counter = 0;
//   void increment() {
//     _counter++;
//     notifyListeners();
//   }
// }

// class WidgetA extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     print('WidgetA is built.');
//     return RaisedButton.icon(
//       icon: Icon(Icons.plus_one),
//       label: Text('plus 1'),
//       // Provider経由でincrement関数を呼ぶ。listen:falseにより、こちらはリビルドされない。
//       onPressed: () =>
//           Provider.of<_HogeChangeNotifier>(context, listen: false).increment(),
//     );
//   }
// }

// class WidgetB extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     print('WidgetB is built');
//     return WidgetC();
//   }
// }

// class WidgetC extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     print('WidgetC is built.');
//     return Column(
//       children: <Widget>[
//         // このConsumerの傘下だけがリビルドされる。
//         Consumer<_HogeChangeNotifier>(
//             builder: (_, _HogeChangeNotifier hoge, __) =>
//                 Text(hoge._counter.toString())),
//         WidgetD(),
//       ],
//     );
//   }
// }

// class WidgetD extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     print('WidgetD is built.');
//     return Text('WidgetD');
//   }
// }
