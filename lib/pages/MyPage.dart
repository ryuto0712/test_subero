import '../importer.dart';

class MyPagePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Navigator(
      onGenerateRoute: (settings) {
        return MaterialPageRoute(
          settings: settings,
          builder: (context) {
            return MyPage();
          },
        );
      },
    );
  }
}
