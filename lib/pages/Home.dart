import '../importer.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Navigator(
      onGenerateRoute: (settings) {
        return MaterialPageRoute(
          settings: settings,
          builder: (context) {
            return Home();
          },
        );
      },
    );
  }
}

// タブ内ナビゲーションの例
// onPressed: () {
//   Navigator.of(context).push(
//     MaterialPageRoute(
//       builder: (context) => const SecondPage(),
//     ),
//   );
// },
