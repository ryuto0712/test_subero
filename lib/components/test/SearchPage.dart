import 'package:flutter/material.dart';
// import 'package:flappy_search_bar/flappy_search_bar.dart';

class SearchPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange[50],
      body: Center(
        child: Text(
          "Search Page",
          style: TextStyle(
            fontSize: 20
          ),
        ),
      ),
    );


  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     appBar: AppBar(),   
  //     body: SearchBar(
  //       onSearch: hoge, // テキスト入力された時に実行される
  //       onItemFound: (item, index) {
  //         return Fuga(item); // onSearchで実行された結果
  //       },
  //     ),    
  //   );
  // }
  }}
