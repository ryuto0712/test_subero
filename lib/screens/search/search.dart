import 'package:flutter/material.dart';
import 'widgets/index.dart';

class Search extends StatelessWidget {
  const Search({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Navigator(
      onGenerateRoute: (settings) {
        return MaterialPageRoute(
          settings: settings,
          builder: (context) {
            return _();
          },
        );
      },
    );
  }

  Widget _() {
    return Scaffold(
      appBar: AppBar(title: Text('検索')),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SearchList(),
            SearchButton(),
            Image.asset('images/search.png'),
          ],
        ),
      ),
    );
  }
}
