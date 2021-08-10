import 'package:flutter/material.dart';
// import 'package:page_view_indicators/circle_page_indicator.dart';
import 'package:carousel_slider/carousel_slider.dart';

class SlideShow extends StatelessWidget {
  CarouselController buttonCarouselController = CarouselController();

  // データ
  List<String> _imageList = [
    "images/toppage_banner.png",
    "images/app_icon_.png",
    "images/app_icon2_.png",
    "images/raimbow.png",
  ];

  Widget slideImage(String image) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(image),
          fit: BoxFit.fitWidth,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) => Column(
        children: <Widget>[
          CarouselSlider.builder(
            itemCount: _imageList.length,
            itemBuilder: (BuildContext context, int itemIndex, int pageViewIndex) => Container(
              child: slideImage(_imageList[itemIndex]),
            ),
            carouselController: buttonCarouselController,
            options: CarouselOptions(
              height: 85,
              autoPlay: true,
              autoPlayInterval: Duration(seconds: 3),
              autoPlayAnimationDuration: Duration(milliseconds: 800),
              autoPlayCurve: Curves.fastOutSlowIn,
              enlargeCenterPage: false,
              viewportFraction: 1.0,
              // aspectRatio: 3.0,
              initialPage: 0,
            ),
          ),
          // RaisedButton(
          //   onPressed: () => buttonCarouselController.nextPage(duration: Duration(milliseconds: 300), curve: Curves.linear),
          //   child: Text('→'),
          // ),
        ],
      );
}

// class SlideShow extends StatefulWidget {
//   @override
//   _SlideShowState createState() => _SlideShowState();
// }

// class _SlideShowState extends State<SlideShow> {
//   // ページコントローラ
//   final PageController controller = PageController(viewportFraction: 1.0);

//   // ページインデックス
//   final _currentPageNotifier = ValueNotifier<int>(0);

//   // データ
//   List<String> _imageList = [
//     "images/toppage_banner.png",
//     "images/app_icon_.png",
//     "images/app_icon2_.png",
//     "images/raimbow.png",
//   ];

//   // List<String> _textList = [
//   //   "トランプ背面",
//   //   "ジョーカー",
//   //   "クイーン",
//   //   "キング",
//   // ];

//   @override
//   void initState() {
//     super.initState();

//     // ページコントローラのページ遷移を監視しページ数を丸める
//     controller.addListener(() {
//       int next = controller.page!.round();
//       print(controller.page);
//       if (_currentPageNotifier.value != next) {
//         setState(() {
//           _currentPageNotifier.value = next;
//         });
//       }
//     });
//   }

//   /*
//    * アニメーションカード生成
//    */
//   AnimatedContainer _createCardAnimate(String imagePath, bool active) {
//     // アクティブと非アクティブのアニメーション設定値
//     // final double top = active ? 100 : 200;
//     // final double side = active ? 0 : 40;

//     return AnimatedContainer(
//       duration: Duration(milliseconds: 500),
//       curve: Curves.easeOutQuint,
//       // margin: EdgeInsets.only(top: top, bottom: 50.0, right: side, left: side),
//       decoration: BoxDecoration(
//         image: DecorationImage(
//           fit: BoxFit.fitWidth,
//           image: Image.asset(imagePath).image,
//         ),
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 100,
//       child: Column(
//         children: <Widget>[
//           /*
//            * ページ
//            */
//           Expanded(
//             child: PageView.builder(
//               controller: controller,
//               itemCount: _imageList.length,
//               itemBuilder: (context, int currentIndex) {
//                 // アクティブ値
//                 bool active = currentIndex == _currentPageNotifier.value;

//                 // カードの生成して返す
//                 return _createCardAnimate(
//                   _imageList[currentIndex],
//                   active,
//                 );
//               },
//             ),
//           ),

//           /*
//            * ページインジケータ
//            */
//           Container(
//             height: 10.0,
//             child: CirclePageIndicator(
//               itemCount: _imageList.length,
//               currentPageNotifier: _currentPageNotifier,
//             ),
//           ),

//           /*
//            * 説明エリア
//            */
//           // Container(
//           //   height: 80.0,
//           //   padding: EdgeInsets.all(10.0),
//           //   child: Container(
//           //     width: double.infinity,
//           //     padding: EdgeInsets.all(10.0),
//           //     decoration: BoxDecoration(
//           //       border: Border.all(
//           //         color: Colors.blue,
//           //         width: 4.0,
//           //       ),
//           //       borderRadius: BorderRadius.circular(10),
//           //     ),
//           //     child: Center(
//           //       child: Text(
//           //         _textList[_currentPageNotifier.value],
//           //         style: TextStyle(
//           //           fontSize: 20.0,
//           //           fontWeight: FontWeight.bold,
//           //         ),
//           //       ),
//           //     ),
//           //   ),
//           // ),
//         ],
//       ),
//     );
//   }
// }
