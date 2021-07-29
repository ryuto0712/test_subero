import '../importer.dart';

class UserPage extends StatelessWidget {
  UserPage();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset('images/user_page.png'),
          ],
        ),
      ),
    );
  }
}
